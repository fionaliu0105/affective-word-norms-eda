## Exploratory Data Analysis of Affective Word Norms

**Author:** Fiona Liu

**Course:** STAT 301-1 Data Science 1 with R (Fall 2025)

**Final Project**

### Project Overview

This project presents an Exploratory Data Analysis (EDA) of a large-scale psycholinguistic dataset containing emotional ratings for nearly 14,000 English words. Using R and the `tidyverse` suite, the analysis replicates well-established findings in affective science and explores new patterns related to gender, linguistic form, and the emotional structure of the English lexicon.

The dataset includes human ratings—on a 1–9 scale—along three core emotional dimensions:
The analysis focuses on three core emotional dimensions:
* **Valence:** The pleasantness of a word (unhappy to happy).
* **Arousal:** The intensity of emotion evoked by a word (calm to excited).
* **Dominance:** The degree of control associated with a word (controlled to in control).

The project examines how these dimensions interact, how perceptions differ by gender, and how grammatical form (e.g., suffixes) shapes emotional meaning.
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

### Key Questions Explored

This analysis addresses the following research questions:
	1.	Distributional Structure
What are the shapes of the distributions for valence, arousal, and dominance?
(Replicates the well-known “positivity bias.”)
	
	2.	Relationships Between Dimensions
How do emotional dimensions relate?
(Identifies the U-shaped association between valence and arousal.)
	
	3.	Gender Differences
Do men and women rate the emotional intensity of words differently?

	4.	Disagreement and Ambiguity
Which words show the most variability (high SD), indicating ambiguous emotional meaning?

	5.	Linguistic Patterns
Do grammatical suffixes (e.g., -tion vs. -ize) correspond to different dominance or agency ratings?

## Repository Structure

The project is organized as follows:

```plaintext
project/
│
├── data/
│   └── BRM-emot-submit.csv            # The Warriner et al. (2013) dataset
│
├── Liu_Fiona_Final_Report.qmd         # MAIN REPORT: Full EDA analysis code & narrative
├── Liu_Fiona_Final_Report.html        # Rendered HTML of the main report
│
├── Liu_Fiona_Executive_Summary.qmd    # Standalone high-level summary of findings
├── Liu_Fiona_Executive_Summary.html   # Rendered HTML of the executive summary
│
├── Liu_Fiona_progress_memo_2.qmd      # Progress update (Memo 2)
├── Liu_Fiona_progress_memo_1_2.qmd    # Initial progress update (Memo 1)
│
├── 0_data_cleaning.r                  # Utility script for initial data checks
├── .gitignore                         # Git configuration
└── README.md                          # Project documentation (this file)
```

## How to Reproduce

1.  **Clone this repository** to your local machine.
2.  Open the project in **RStudio**.
3.  Ensure the following packages are installed:
    ```r
    install.packages(c("tidyverse", "knitr", "gt", "patchwork"))
    ```
4.  Open `Liu_Fiona_Final_Report.qmd` and click **Render** to generate the full analysis.









