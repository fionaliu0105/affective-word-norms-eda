
library(tidyverse)
library(knitr)
library(gt)
library(patchwork)

affective_data <- read_csv("data/BRM-emot-submit.csv")


summary_stats <- affective_data |>
  summarise(
    Variable = c("Valence", "Arousal", "Dominance"),
    Mean = c(mean(V.Mean.Sum), mean(A.Mean.Sum), mean(D.Mean.Sum)),
    Median = c(median(V.Mean.Sum), median(A.Mean.Sum), median(D.Mean.Sum)),
    SD = c(sd(V.Mean.Sum), sd(A.Mean.Sum), sd(D.Mean.Sum)),
    Min = c(min(V.Mean.Sum), min(A.Mean.Sum), min(D.Mean.Sum)),
    Max = c(max(V.Mean.Sum), max(A.Mean.Sum), max(D.Mean.Sum))
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