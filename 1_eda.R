# Univariate Analysis: Distributions
long_dims <- affective_data |> 
  select(Valence = V.Mean.Sum, Arousal = A.Mean.Sum, Dominance = D.Mean.Sum) |> 
  pivot_longer(cols = everything(), names_to = "Dimension", values_to = "Rating")

ggplot(long_dims, aes(x = Rating, fill = Dimension)) +
  geom_histogram(binwidth = 0.25, color = "white", show.legend = FALSE) +
  facet_wrap(~Dimension, scales = "free_y") +
  scale_fill_manual(values = c("steelblue2", "indianred3", "purple2")) +
  labs(
    x = "Mean Rating (1-9 Scale)",
    y = "Count of Words"
  ) +
  theme_minimal()

# Bivariate Analysis
ggplot(affective_data, aes(x = V.Mean.Sum, y = A.Mean.Sum)) +
  geom_point(alpha = 0.1, color = "darkgray") +
  geom_smooth(method = "loess", color = "steelblue", se = FALSE, size = 1.2) +
  annotate("text", x = 2, y = 7, label = "High Arousal\nNegative", color = "steelblue") +
  annotate("text", x = 8, y = 7, label = "High Arousal\nPositive", color = "steelblue") +
  annotate("text", x = 5, y = 3, label = "Low Arousal\nNeutral", color = "steelblue") +
  labs(
    x = "Valence (Pleasantness)",
    y = "Arousal (Intensity)"
  ) +
  theme_minimal()
```

# demographic 

gender_long <- affective_data |> 
  select(
    Word,
    Valence_Overall = V.Mean.Sum, Valence_Male = V.Mean.M, Valence_Female = V.Mean.F,
    
    Arousal_Overall = A.Mean.Sum, Arousal_Male = A.Mean.M, Arousal_Female = A.Mean.F,
    
    Dominance_Overall = D.Mean.Sum, Dominance_Male = D.Mean.M, Dominance_Female = D.Mean.F
  ) |> 
  
  pivot_longer(
    cols = -Word,
    names_to = c("Dimension", "Group"),
    names_sep = "_", 
    values_to = "Rating"
  )

ggplot(gender_long, aes(x = Rating, color = Group, fill = Group)) +
  geom_density(alpha = 0.3) +
  facet_wrap(~Dimension, scales = "free_y", ncol = 1) +
  scale_color_manual(values = c("Female" = "violet", "Male" = "steelblue2", "Overall" = "grey50")) +
  scale_fill_manual(values = c("Female" = "violet", "Male" = "steelblue2", "Overall" = "gray")) +
  labs(
    x = "Rating Score (1-9)",
    y = "Density",
    title = "Rating Distributions by Gender"
  ) +
  theme_minimal()

affective_data |> 
  summarise(
    Mean_Male_Arousal = mean(A.Mean.M),
    Mean_Female_Arousal = mean(A.Mean.F),
    Difference = mean(A.Mean.M - A.Mean.F)
  ) |>
  gt() |>
  fmt_number(columns = everything(), decimals = 2) |>
  cols_label(
    Mean_Male_Arousal = "Avg. Male Arousal",
    Mean_Female_Arousal = "Avg. Female Arousal",
    Difference = "Net Difference"
  ) |>
  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels()
  )

gender_comp <- bind_rows(
  affective_data |> select(Male = V.Mean.M, Female = V.Mean.F) |> mutate(Dimension = "Valence"),
  affective_data |> select(Male = A.Mean.M, Female = A.Mean.F) |> mutate(Dimension = "Arousal"),
  affective_data |> select(Male = D.Mean.M, Female = D.Mean.F) |> mutate(Dimension = "Dominance")
)

ggplot(gender_comp, aes(x = Male, y = Female)) +
  geom_point(alpha = 0.05, color = "steelblue2") +
  geom_abline(slope = 1, intercept = 0, color = "black", size = 0.5) +
  facet_wrap(~Dimension) +
  labs(
    x = "Male Mean Rating",
    y = "Female Mean Rating"
  ) +
  theme_minimal() +
  coord_fixed() 


outliers <- affective_data |>
  mutate(Arousal_Diff = A.Mean.M - A.Mean.F) |>
  select(Word, Male_Rating = A.Mean.M, Female_Rating = A.Mean.F, Diff = Arousal_Diff)

top_male_arousal <- outliers |> arrange(desc(Diff)) |> head(5) |> mutate(Category = "Men felt more intense")

top_female_arousal <- outliers |> arrange(Diff) |> head(5) |> mutate(Category = "Women felt more intense")

bind_rows(top_male_arousal, top_female_arousal) |>
  gt(groupname_col = "Category") |>
  fmt_number(columns = c(Male_Rating, Female_Rating, Diff), decimals = 2) |>
  cols_label(
    Male_Rating = "Male Score",
    Female_Rating = "Female Score",
    Diff = "Difference"
  ) |>
  tab_style(
    style = list(cell_fill(color = "whitesmoke"), cell_text(weight = "bold")),
    locations = cells_row_groups()
  )

# linguistics analysis

suffix_data <- affective_data |>
  mutate(
    Suffix = case_when(
      str_detect(Word, "tion$") ~ "Nouns (-tion)",
      str_detect(Word, "ize$") ~ "Verbs (-ize)",
      TRUE ~ NA_character_
    )
  ) |>
  filter(!is.na(Suffix))

ggplot(suffix_data, aes(x = Suffix, y = D.Mean.Sum, fill = Suffix)) +
  geom_boxplot(alpha = 0.7, show.legend = FALSE, outlier.shape = 1) +
  scale_fill_manual(values = c("orange", "skyblue")) +
  labs(
    x = "Word Ending",
    y = "Dominance Rating",
    subtitle = "Comparing Abstract Nouns vs. Active Verbs"
  ) +
  theme_minimal()

# ambiguity analysis
get_top_ambiguous <- function(data, sd_col, mean_col, category_name) {
  data |>
    arrange(desc({{ sd_col }})) |>
    head(5) |>
    
    mutate(Word = case_when(
      Word == "fuck" ~ "f***",
      Word == "fucking" ~ "f***ing",
      Word == "shitfaced" ~ "sh*tfaced",
      TRUE ~ Word 
    )) |>
    select(Word, Mean_Rating = {{ mean_col }}, SD = {{ sd_col }}) |>
    mutate(Dimension = category_name)
}

ambiguous_words <- bind_rows(
  get_top_ambiguous(affective_data, V.SD.Sum, V.Mean.Sum, "Valence (Pleasantness)"),
  get_top_ambiguous(affective_data, A.SD.Sum, A.Mean.Sum, "Arousal (Intensity)"),
  get_top_ambiguous(affective_data, D.SD.Sum, D.Mean.Sum, "Dominance (Control)")
)

ambiguous_words |>
  group_by(Dimension) |>
  gt() |>
  fmt_number(columns = c(Mean_Rating, SD), decimals = 2) |>
  cols_label(
    Mean_Rating = "Mean Score",
    SD = "Std. Dev. (Disagreement)"
  ) |>
  tab_style(
    style = list(cell_fill(color = "whitesmoke"), cell_text(weight = "bold")),
    locations = cells_row_groups()
  ) |>
  tab_footnote(
    footnote = "Explicit terms have been masked for professional presentation, but remain part of the statistical analysis.",
    locations = cells_column_labels(columns = Word)
  )