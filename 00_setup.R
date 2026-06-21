library(tidyverse)
library(knitr)
library(gt)
library(patchwork)

affective_data <- read_csv("data/BRM-emot-submit.csv", show_col_types = FALSE)

summary_stats <- tibble(
  Variable = c("Valence", "Arousal", "Dominance"),
  Mean = c(
    mean(affective_data$V.Mean.Sum),
    mean(affective_data$A.Mean.Sum),
    mean(affective_data$D.Mean.Sum)
  ),
  Median = c(
    median(affective_data$V.Mean.Sum),
    median(affective_data$A.Mean.Sum),
    median(affective_data$D.Mean.Sum)
  ),
  SD = c(
    sd(affective_data$V.Mean.Sum),
    sd(affective_data$A.Mean.Sum),
    sd(affective_data$D.Mean.Sum)
  ),
  Min = c(
    min(affective_data$V.Mean.Sum),
    min(affective_data$A.Mean.Sum),
    min(affective_data$D.Mean.Sum)
  ),
  Max = c(
    max(affective_data$V.Mean.Sum),
    max(affective_data$A.Mean.Sum),
    max(affective_data$D.Mean.Sum)
  )
)

summary_stats |>
  gt() |>
  fmt_number(columns = c(Mean, Median, SD), decimals = 2) |>
  cols_label(SD = "Std. Dev.") |>
  tab_header(title = "Descriptive Statistics of Affective Dimensions") |>
  opt_align_table_header(align = "left") |>
  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels()
  )
