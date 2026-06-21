source("00_setup.R")

dir.create("figures", showWarnings = FALSE)

cor_matrix <- affective_data |>
  select(
    Valence = V.Mean.Sum,
    Arousal = A.Mean.Sum,
    Dominance = D.Mean.Sum
  ) |>
  cor()

cor_long <- as.data.frame(cor_matrix) |>
  rownames_to_column(var = "Dimension1") |>
  pivot_longer(
    cols = -Dimension1,
    names_to = "Dimension2",
    values_to = "Correlation"
  )

p_correlation_heatmap <- ggplot(cor_long, aes(x = Dimension1, y = Dimension2, fill = Correlation)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(Correlation, 2)), color = "black", size = 5) +
  scale_fill_gradient2(
    low = "skyblue",
    mid = "white",
    high = "indianred2",
    midpoint = 0,
    limits = c(-1, 1),
    name = "Pearson r"
  ) +
  labs(x = NULL, y = NULL) +
  theme_minimal() +
  coord_fixed() +
  theme(
    axis.text = element_text(size = 12, face = "bold"),
    panel.grid = element_blank()
  )

print(p_correlation_heatmap)

ggsave(
  filename = "figures/correlation_heatmap.png",
  plot = p_correlation_heatmap,
  width = 5.5,
  height = 5,
  dpi = 300
)
