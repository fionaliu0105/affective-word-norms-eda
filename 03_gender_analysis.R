source("00_setup.R")

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

p_gender_density <- ggplot(gender_long, aes(x = Rating, color = Group, fill = Group)) +
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

print(p_gender_density)

gender_gap_summary <- affective_data |>
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

print(gender_gap_summary)

gender_comp <- bind_rows(
  affective_data |>
    select(Male = V.Mean.M, Female = V.Mean.F) |>
    mutate(Dimension = "Valence"),
  affective_data |>
    select(Male = A.Mean.M, Female = A.Mean.F) |>
    mutate(Dimension = "Arousal"),
  affective_data |>
    select(Male = D.Mean.M, Female = D.Mean.F) |>
    mutate(Dimension = "Dominance")
)

p_gender_scatter <- ggplot(gender_comp, aes(x = Male, y = Female)) +
  geom_point(alpha = 0.05, color = "steelblue2") +
  geom_abline(slope = 1, intercept = 0, color = "black", linewidth = 0.5) +
  facet_wrap(~Dimension) +
  labs(
    x = "Male Mean Rating",
    y = "Female Mean Rating"
  ) +
  theme_minimal() +
  coord_fixed()

print(p_gender_scatter)

outliers <- affective_data |>
  mutate(Arousal_Diff = A.Mean.M - A.Mean.F) |>
  select(Word, Male_Rating = A.Mean.M, Female_Rating = A.Mean.F, Diff = Arousal_Diff)

top_male_arousal <- outliers |> arrange(desc(Diff)) |> head(5) |> mutate(Category = "Men felt more intense")
top_female_arousal <- outliers |> arrange(Diff) |> head(5) |> mutate(Category = "Women felt more intense")

top_arousal_outliers <- bind_rows(top_male_arousal, top_female_arousal) |>
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

print(top_arousal_outliers)
