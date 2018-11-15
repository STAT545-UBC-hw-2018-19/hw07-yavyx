#' Major Sports Google Trends and Trump voting
#'
#' Google Trends data for major sports Google searches and the percentage of Trump voters
#' in each designated market area in the US.
#'
#'
#' @format A tibble with 207 rows and 10 variables:
#' \describe{
#'   \item{City}{factor with 204 levels}
#'   \item{State}{factor with 46 levels}
#'   \item{TrumpVote}{numeric, fraction of Trump voters}
#'   \item{Sport}{factor with 7 levels}
#'   \item{searchPercentage}{numeric, fraction of searches for that sport}
#' }
#' @source \url{https://github.com/fivethirtyeight/data/blob/master/nfl-fandom/NFL_fandom_data-google_trends.csv}
"sportsPolitics"

