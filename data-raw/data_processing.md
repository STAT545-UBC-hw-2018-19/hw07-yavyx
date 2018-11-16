Data Processing
================
Javier Castillo-Arnemann

With this document we'll explore how we can import and process a dataset to use it in a package in a reproducible way.

The first step is to load our libraries and create a directory where our raw data will reside:

``` r
suppressPackageStartupMessages(library(tidyverse))

usethis::use_data_raw() #Create data-raw directory
```

    ## <U+2714> Setting active project to 'C:/Users/Javier/OneDrive/UBC/STAT 545/hw07-yavyx'

    ## Next:

    ## <U+25CF> Add data creation scripts in 'data-raw/'
    ## <U+25CF> Use `usethis::use_data()` to add data to package

After creating the directory, we download our data here (we don't do this with R).

Let's import the dataset and see how it looks.

``` r
sportsPolitics <- read.csv("NFL_fandom_data-google_trends.csv")

head(sportsPolitics) %>% knitr::kable()
```

| DMA                        | NFL | NBA | MLB | NHL | NASCAR | CBB | CFB | Trump.2016.Vote. |
|:---------------------------|:----|:----|:----|:----|:-------|:----|:----|:-----------------|
| Abilene-Sweetwater TX      | 45% | 21% | 14% | 2%  | 4%     | 3%  | 11% | 79.13%           |
| Albany GA                  | 32% | 30% | 9%  | 1%  | 8%     | 3%  | 17% | 59.12%           |
| Albany-Schenectady-Troy NY | 40% | 20% | 20% | 8%  | 6%     | 3%  | 4%  | 44.11%           |
| Albuquerque-Santa Fe NM    | 53% | 21% | 11% | 3%  | 3%     | 4%  | 6%  | 39.58%           |
| Alexandria LA              | 42% | 28% | 9%  | 1%  | 5%     | 3%  | 12% | 69.64%           |
| Alpena MI                  | 28% | 13% | 21% | 12% | 10%    | 7%  | 9%  | 63.61%           |

``` r
str(sportsPolitics)
```

    ## 'data.frame':    207 obs. of  9 variables:
    ##  $ DMA             : Factor w/ 207 levels "Abilene-Sweetwater TX",..: 1 3 2 4 5 6 7 8 9 10 ...
    ##  $ NFL             : Factor w/ 32 levels "22%","24%","26%",..: 22 9 17 30 19 5 24 13 16 17 ...
    ##  $ NBA             : Factor w/ 26 levels "13%","14%","15%",..: 9 18 8 9 16 1 10 16 14 17 ...
    ##  $ MLB             : Factor w/ 19 levels "10%","11%","12%",..: 5 19 11 2 19 12 3 1 18 2 ...
    ##  $ NHL             : Factor w/ 19 levels "0%","1%","10%",..: 10 2 18 13 2 5 10 13 13 13 ...
    ##  $ NASCAR          : Factor w/ 14 levels "1%","10%","11%",..: 9 13 11 8 10 2 10 10 13 8 ...
    ##  $ CBB             : Factor w/ 18 levels "1%","10%","11%",..: 11 11 11 13 11 16 11 14 13 11 ...
    ##  $ CFB             : Factor w/ 23 levels "10%","11%","12%",..: 2 8 18 20 3 23 1 5 4 2 ...
    ##  $ Trump.2016.Vote.: Factor w/ 197 levels "18.56%","22.95%",..: 197 124 41 25 176 145 196 53 82 26 ...

As we can see, this data needs to be processed further to make it tidy and easy to use with R. We want to separate the state from the city and have the percentages as numeric values.

``` r
sportsPolitics <- sportsPolitics %>%
  rename(City = DMA,
         TrumpVote = Trump.2016.Vote.) %>% #Rename columns to make more sense
  mutate(State = as.factor(str_sub(City, start = -2)),#Extract last two characters in string (state)
         City = as.factor(str_sub(City, end = -3))) #Remove last three charaters from city (State and space)

sportsPolitics[, 2:9] <- map(sportsPolitics[, 2:9], str_sub, end = -2) #Remove percentage signs
sportsPolitics[, 2:9] <- map(sportsPolitics[, 2:9], as.numeric)  #Convert to numeric elements
sportsPolitics[, 2:9] <- map(sportsPolitics[, 2:9], function(x) x/100) #Divide by 100

sportsPolitics <- as.tibble(sportsPolitics) %>%
  dplyr::select(c(City, State, everything())) #Reorder columns
```

Let's see how our dataset looks now.

``` r
head(sportsPolitics) %>% knitr::kable()
```

| City                    | State |   NFL|   NBA|   MLB|   NHL|  NASCAR|   CBB|   CFB|  TrumpVote|
|:------------------------|:------|-----:|-----:|-----:|-----:|-------:|-----:|-----:|----------:|
| Abilene-Sweetwater      | TX    |  0.45|  0.21|  0.14|  0.02|    0.04|  0.03|  0.11|     0.7913|
| Albany                  | GA    |  0.32|  0.30|  0.09|  0.01|    0.08|  0.03|  0.17|     0.5912|
| Albany-Schenectady-Troy | NY    |  0.40|  0.20|  0.20|  0.08|    0.06|  0.03|  0.04|     0.4411|
| Albuquerque-Santa Fe    | NM    |  0.53|  0.21|  0.11|  0.03|    0.03|  0.04|  0.06|     0.3958|
| Alexandria              | LA    |  0.42|  0.28|  0.09|  0.01|    0.05|  0.03|  0.12|     0.6964|
| Alpena                  | MI    |  0.28|  0.13|  0.21|  0.12|    0.10|  0.07|  0.09|     0.6361|

``` r
str(sportsPolitics)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    207 obs. of  10 variables:
    ##  $ City     : Factor w/ 204 levels "Abilene-Sweetwater ",..: 1 3 2 4 5 6 7 8 9 10 ...
    ##  $ State    : Factor w/ 46 levels "AL","AR","AZ",..: 40 9 32 30 17 21 40 9 9 40 ...
    ##  $ NFL      : num  0.45 0.32 0.4 0.53 0.42 0.28 0.47 0.36 0.39 0.4 ...
    ##  $ NBA      : num  0.21 0.3 0.2 0.21 0.28 0.13 0.22 0.28 0.26 0.29 ...
    ##  $ MLB      : num  0.14 0.09 0.2 0.11 0.09 0.21 0.12 0.1 0.08 0.11 ...
    ##  $ NHL      : num  0.02 0.01 0.08 0.03 0.01 0.12 0.02 0.03 0.03 0.03 ...
    ##  $ NASCAR   : num  0.04 0.08 0.06 0.03 0.05 0.1 0.05 0.05 0.08 0.03 ...
    ##  $ CBB      : num  0.03 0.03 0.03 0.04 0.03 0.07 0.03 0.05 0.04 0.03 ...
    ##  $ CFB      : num  0.11 0.17 0.04 0.06 0.12 0.09 0.1 0.14 0.13 0.11 ...
    ##  $ TrumpVote: num  0.791 0.591 0.441 0.396 0.696 ...

Looks good! We still have to tidy our data so every column is a variable.

``` r
sportsPolitics <- sportsPolitics %>%
  gather(key = "Sport", 
         value = searchPercentage, 
         c(NFL, NBA, MLB, NHL, NASCAR, CBB, CFB))

sportsPolitics$Sport <- as.factor(sportsPolitics$Sport)

str(sportsPolitics)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    1449 obs. of  5 variables:
    ##  $ City            : Factor w/ 204 levels "Abilene-Sweetwater ",..: 1 3 2 4 5 6 7 8 9 10 ...
    ##  $ State           : Factor w/ 46 levels "AL","AR","AZ",..: 40 9 32 30 17 21 40 9 9 40 ...
    ##  $ TrumpVote       : num  0.791 0.591 0.441 0.396 0.696 ...
    ##  $ Sport           : Factor w/ 7 levels "CBB","CFB","MLB",..: 6 6 6 6 6 6 6 6 6 6 ...
    ##  $ searchPercentage: num  0.45 0.32 0.4 0.53 0.42 0.28 0.47 0.36 0.39 0.4 ...

Perfect! Now that our data is better suited to work with R, we can save it in our package so it is available whenever we load the package.

``` r
usethis::use_data(sportsPolitics, overwrite = TRUE) #overwrite so we can ovewrite the existing file after making changes
```

    ## <U+2714> Saving 'sportsPolitics' to 'data/sportsPolitics.rda'
