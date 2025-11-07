## Exploratory Data Analysis of Affective Word Norms

**Author:** Fiona Liu

**Course:** STAT 301-1 Data Science 1 with R (Fall 2025)

**Final Project**

### Project Overview

This project is an Exploratory Data Analysis (EDA) of a large-scale psycholinguistic dataset containing emotional ratings for nearly 14,000 English words. The goal is to use R, specifically the `tidyverse` suite of tools (`ggplot2`, `dplyr`, `stringr`), to replicate key findings from cognitive science literature and uncover relationships between the grammatical forms of words and their emotional content.

The analysis focuses on three core emotional dimensions:
* **Valence:** The pleasantness of a word (negative to positive).
* **Arousal:** The intensity of emotion evoked by a word (calm to excited).
* **Dominance:** The degree of control associated with a word (submissive to dominant).

### Dataset

The data used in this project comes from Warriner et al. (2013). It contains affective norms for 13,915 English lemmas collected via crowdsourcing.

* **Citation:** Warriner, A. B., Kuperman, V., & Brysbaert, M. (2013). Norms of valence, arousal, and dominance for 13,915 English lemmas. *Behavior Research Methods, 45*(4), 1191–1207. https://doi.org/10.3758/s13428-012-0314-x.
* **Source URL:** [https://link.springer.com/article/10.3758/s13428-012-0314-x](https://link.springer.com/article/10.3758/s13428-012-0314-x), located in the "Electronic supplementary material"
* **License/Access:** Data is available for academic and research use.

#### Data Dictionary (Key Variables)

| Variable | Original Name | Description |
| :--- | :--- | :--- |
| `Word` | `Word` | The English lemma rated by participants. |
| `Valence` | `V.Mean.Sum` | Mean valence rating (1 = unhappy, 9 = happy). |
| `Arousal` | `A.Mean.Sum` | Mean arousal rating (1 = calm, 9 = excited). |
| `Dominance` | `D.Mean.Sum` | Mean dominance rating (1 = controlled, 9 = in control). |
| `Valence_SD` | `V.SD.Sum` | Standard deviation of valence ratings (measure of agreement). |
| `Valence_M` | `V.Mean.M` | Mean valence rating from male participants. |
| `Valence_F` | `V.Mean.F` | Mean valence rating from female participants. |

### Key Analysis Goals

This project aims to explore the following questions:

1.  **Univariate Distributions:** What are the shapes of the distributions for valence, arousal, and dominance? (Replicating the "positivity bias").

2.  **Bivariate Relationships:** How do these dimensions relate to one another? (Investigating the U-shaped relationship between valence and arousal).

3.  **Demographic Differences:** Do male and female participants rate certain categories of words (e.g., "taboo" words) differently?

4.  **Ambiguity & Agreement:** Which words have the highest disagreement (standard deviation) in their ratings?

5.  **Linguistic Analysis:** Do words with common noun suffixes (e.g., *-ment*) differ emotionally from words with common verb suffixes (e.g., *-ize*)?

### Repository Structure

* `data/`: Contains the raw data file (`BRM-emot-submit.csv`).
* `plots/`: Folder for saved plots from the analysis (optional).
* `Liu_Fiona_Final_Project.qmd`: Main Quarto analysis document.
* `Liu_Fiona_Final_Project.html`: Rendered final report.
* `Liu_Fiona_progress_memo_1.qmd`: Progress memo.
* `README.md`: Project overview (this file).

### Usage Needed to Run

To replicate this analysis:

1.  Clone this repository.

2.  Ensure you have R and RStudio installed with the following packages: `tidyverse`, `knitr`, `skimr`.

3.  Open `Liu_Fiona_Final_Project.qmd` in RStudio.

4.  Render the file to HTML to view the full analysis and visualizations.