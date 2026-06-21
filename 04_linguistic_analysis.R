source("00_setup.R")

suffix_data <- affective_data |>
  mutate(
    Suffix = case_when(
      str_detect(Word, "tion$") ~ "Nouns (-tion)",
      str_detect(Word, "ize$") ~ "Verbs (-ize)",
      TRUE ~ NA_character_
    )
  ) |>
  filter(!is.na(Suffix))

p_suffix_dominance <- ggplot(suffix_data, aes(x = Suffix, y = D.Mean.Sum, fill = Suffix)) +
  geom_boxplot(alpha = 0.7, show.legend = FALSE, outlier.shape = 1) +
  scale_fill_manual(values = c("orange", "skyblue")) +
  labs(
    x = "Word Ending",
    y = "Dominance Rating",
    subtitle = "Comparing Abstract Nouns vs. Active Verbs"
  ) +
  theme_minimal()

print(p_suffix_dominance)
