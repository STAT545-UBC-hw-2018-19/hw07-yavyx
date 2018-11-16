hw - 07 README
================
Javier Castillo-Arnemann

This is a repository containing the 2nd assignment of the **STAT 547** course. The course main page can be found [here](http://stat545.com/Classroom). The instructions for this assignment can be accesed [here](http://stat545.com/Classroom/assignments/hw07/hw07.html).

Package Information
-------------------

For this homework I created a new data package called `sportsPolitics` that uses data from [FiveThirtyEight](https://fivethirtyeight.com/), a great politics, economics and sports blog that employs data analysis for all their articles. This dataset was used in their [How Every NFL Team's Fans Lean Politically](https://fivethirtyeight.com/features/how-every-nfl-teams-fans-lean-politically/) article, and summarizes the Google Trends results for Google searches of major sports in the US (NFL, MLB, NHL, NBA, College Football (CFB) and College Baseball (CBB)). Each sport has a relative search percentage for every designated market area in the US, plus the percent of Trump voters in each area.

The [data processing](https://github.com/STAT545-UBC-students/hw07-yavyx/blob/master/data-raw/data_processing.md) file details how the [raw data](https://github.com/STAT545-UBC-students/hw07-yavyx/blob/master/data-raw/NFL_fandom_data-google_trends.csv) was turned into a tidy dataset that loads automatically with the package.

The [vignette](https://github.com/STAT545-UBC-students/hw07-yavyx/blob/master/vignettes/using_sportspolitics.Rmd) shows how to use the package and its single function, `plot_sport()`.

To Install
----------

``` r
library(devtools)
install_github("STAT545-UBC-students/hw07-yavyx")
```

    ## Downloading GitHub repo STAT545-UBC-students/hw07-yavyx@master

    ## WARNING: Rtools is required to build R packages, but is not currently installed.
    ## 
    ## Please download and install Rtools 3.5 from http://cran.r-project.org/bin/windows/Rtools/.

    ##   
      
      
       checking for file 'C:\Users\Javier\AppData\Local\Temp\Rtmpig6tdM\remotes367c5fd85c5c\STAT545-UBC-students-hw07-yavyx-04cdf06/DESCRIPTION' ...
      
       checking for file 'C:\Users\Javier\AppData\Local\Temp\Rtmpig6tdM\remotes367c5fd85c5c\STAT545-UBC-students-hw07-yavyx-04cdf06/DESCRIPTION' ... 
      
    v  checking for file 'C:\Users\Javier\AppData\Local\Temp\Rtmpig6tdM\remotes367c5fd85c5c\STAT545-UBC-students-hw07-yavyx-04cdf06/DESCRIPTION' (599ms)
    ## 
      
      
      
    -  preparing 'sportsPolitics':
    ##    checking DESCRIPTION meta-information ...
      
       checking DESCRIPTION meta-information ... 
      
    v  checking DESCRIPTION meta-information
    ## 
      
      
      
    -  checking for LF line-endings in source and make files and shell scripts
    ## 
      
    -  checking for empty or unneeded directories
    ## 
      
      
      
    -  looking to see if a 'data/datalist' file should be added
    ## 
      
      
      
    -  building 'sportsPolitics_0.1.0.tar.gz'
    ## 
      
       
    ## 

    ## Installing package into 'C:/Users/Javier/Documents/R/win-library/3.5'
    ## (as 'lib' is unspecified)

This package requires `ggplot2` and `dplyr` to work, so make sure you load them too.

Resources
---------

The following pages where useful to develop this package.
---------------------------------------------------------

title: "hw - 07 README" author: "Javier Castillo-Arnemann" output: github\_document ---

This is a repository containing the 2nd assignment of the **STAT 547** course. The course main page can be found [here](http://stat545.com/Classroom). The instructions for this assignment can be accesed [here](http://stat545.com/Classroom/assignments/hw07/hw07.html).

Package Information
-------------------

For this homework I created a new data package called `sportsPolitics` that uses data from [FiveThirtyEight](https://fivethirtyeight.com/), a great politics, economics and sports blog that employs data analysis for all their articles. This dataset was used in their [How Every NFL Team's Fans Lean Politically](https://fivethirtyeight.com/features/how-every-nfl-teams-fans-lean-politically/) article, and summarizes the Google Trends results for Google searches of major sports in the US (NFL, MLB, NHL, NBA, College Football (CFB) and College Baseball (CBB)). Each sport has a relative search percentage for every designated market area in the US, plus the percent of Trump voters in each area.

The [data processing](https://github.com/STAT545-UBC-students/hw07-yavyx/blob/master/data-raw/data_processing.md) file details how the [raw data](https://github.com/STAT545-UBC-students/hw07-yavyx/blob/master/data-raw/NFL_fandom_data-google_trends.csv) was turned into a tidy dataset that loads automatically with the package.

The [vignette](https://github.com/STAT545-UBC-students/hw07-yavyx/blob/master/vignettes/using_sportspolitics.Rmd) shows how to use the package and its single function, `plot_sport()`.

To Install
----------

``` r
library(devtools)
install_github("STAT545-UBC-students/hw07-yavyx")
```

    ## Skipping install of 'sportsPolitics' from a github remote, the SHA1 (04cdf061) has not changed since last install.
    ##   Use `force = TRUE` to force installation

This package requires `ggplot2` and `dplyr` to work, so make sure you load them too.

Resources
---------

-   [Happy Git and GitHub for the useR, Chapter 18](http://happygitwithr.com/existing-github-last.html#connect-to-github)
-   [Taking your data to go with R packages](http://www.davekleinschmidt.com/r-packages/)
-   [R packages, raw data](http://r-pkgs.had.co.nz/data.html#data-extdata)
-   [R packages, Object documentation](http://r-pkgs.had.co.nz/man.html)
-   [Putting your R package on GitHub](http://kbroman.org/pkg_primer/pages/github.html)
-   [STAT 547M Class Meetings 5 and 6: R Packages](http://stat545.com/Classroom/notes/cm105.nb.html#7_documentation_and_testing)

All these pages where useful to develop this package.
