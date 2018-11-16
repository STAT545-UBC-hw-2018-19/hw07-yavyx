#' @title Plot sport search percentage against Trump voting percentage
#'
#' @description Plot search percentage against Trump voting percentage in \code{\link{sportsPolitics}}
#'
#' @param sport A string, has to be one of the sports in \code{\link{sportsPolitics}}. "all" is the default.
#'
#' @return A scatter plot of the selected sport. If sport = "all" returns a plot for every sport.
#'
#' @export
#'

plot_sport <- function(sport = "all"){
  if (!(sport %in% sportsPolitics$Sport) & sport != "all") {
    stop("Sport could not be found. Check that your sport is spelled properly and included in sportsPolitics.")  #Stop program if input is unexpected
  } 
  else if (sport == "all") {
    ggplot2::ggplot(sportsPolitics, aes(TrumpVote, searchPercentage)) +
      geom_point(color = "steelblue") +
      geom_smooth(color = "red", method = "lm", se = FALSE) +
      facet_wrap(~ Sport) +
      labs(title = "Search Percentage vs Trump vote by sport",
           x = "Trump vote (%)",
           y = "Google Search Percentage (%)") +
      theme_bw()
  } else {
    sportsPolitics %>%
      dplyr::filter(Sport == sport) %>%
      ggplot2::ggplot(aes(TrumpVote, searchPercentage)) +
      geom_point(color = "steelblue") +
        geom_smooth(color = "red", method = "lm", se = FALSE) +
        labs(title = paste(sport,"Search Percentage vs Trump vote", sep = " "),
             x = "Trump vote (%)",
             y = "Google Search Percentage (%)") +
        theme_bw()
  }
}
