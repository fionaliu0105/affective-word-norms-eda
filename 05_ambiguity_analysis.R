source("00_setup.R")

get_top_ambiguous <- function(data, sd_col, mean_col, category_name) {
  data |>
    arrange(desc({{ sd_col }})) |>
    head(5) |>
    mutate(
      Word = case_when(
        Word == "fuck" ~ "f***",
        Word == "fucking" ~ "f***ing",
        Word == "shitfaced" ~ "sh*tfaced",
        TRUE ~ Word
      )
    ) |>
    select(Word, Mean_Rating = {{ mean_col }}, SD = {{ sd_col }}) |>
    mutate(Dimension = category_name)
}

ambiguous_words <- bind_rows(
  get_top_ambiguous(affective_data, V.SD.Sum, V.Mean.Sum, "Valence (Pleasantness)"),
  get_top_ambiguous(affective_data, A.SD.Sum, A.Mean.Sum, "Arousal (Intensity)"),
  get_top_ambiguous(affective_data, D.SD.Sum, D.Mean.Sum, "Dominance (Control)")
)

top_ambiguous_words <- ambiguous_words |>
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

print(top_ambiguous_words)
