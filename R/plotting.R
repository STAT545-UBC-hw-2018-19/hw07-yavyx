ggplot(sportsPolitics, aes(TrumpVote, searchPercentage)) +
  geom_point(color = "steelblue") +
  geom_smooth(color = "red", method = "lm") +
  facet_wrap(~ Sport) +
  labs(title = "Search Percentage vs Trump vote by sport",
       x = "Trump vote (%)",
       y = "Google Search Percentage (%)") +
  theme_bw()
