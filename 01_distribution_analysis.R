source("00_setup.R")

# Univariate analysis: distributions
long_dims <- affective_data |>
  select(
    Valence = V.Mean.Sum,
    Arousal = A.Mean.Sum,
    Dominance = D.Mean.Sum
  ) |>
  pivot_longer(
    cols = everything(),
    names_to = "Dimension",
    values_to = "Rating"
  )

p_distributions <- ggplot(long_dims, aes(x = Rating, fill = Dimension)) +
  geom_histogram(binwidth = 0.25, color = "white", show.legend = FALSE) +
  facet_wrap(~Dimension, scales = "free_y") +
  scale_fill_manual(values = c("steelblue2", "indianred3", "purple2")) +
  labs(
    x = "Mean Rating (1-9 Scale)",
    y = "Count of Words"
  ) +
  theme_minimal()

print(p_distributions)

# Bivariate analysis
p_valence_arousal <- ggplot(affective_data, aes(x = V.Mean.Sum, y = A.Mean.Sum)) +
  geom_point(alpha = 0.1, color = "darkgray") +
  geom_smooth(method = "loess", color = "steelblue", se = FALSE, linewidth = 1.2) +
  annotate("text", x = 2, y = 7, label = "High Arousal\nNegative", color = "steelblue") +
  annotate("text", x = 8, y = 7, label = "High Arousal\nPositive", color = "steelblue") +
  annotate("text", x = 5, y = 3, label = "Low Arousal\nNeutral", color = "steelblue") +
  labs(
    x = "Valence (Pleasantness)",
    y = "Arousal (Intensity)"
  ) +
  theme_minimal()

print(p_valence_arousal)
