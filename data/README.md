## Dataset: Affective Norms for English Lemmas

### Overview

This directory contains the dataset used for the final project in STAT 301-1. The data consists of emotional ratings for 13,915 English words (lemmas), gathered through a large-scale crowdsourcing study.

### Files

* `BRM-emot-submit.csv`: The raw data file containing all ratings and word information.

### Source & Citation

This data was originally published associated with the following paper:

Warriner, A. B., Kuperman, V., & Brysbaert, M. (2013). Norms of valence, arousal, and dominance for 13,915 English lemmas. *Behavior Research Methods*, 45(4), 1191–1207. doi:10.3758/s13428-012-0314-x

* **Original Source URL:** [http://crr.ugent.be/archives/1003](http://crr.ugent.be/archives/1003)
* **Date Accessed:** November 3, 2025

### Data Collection Summary

Participants (US residents) rated words on a 9-point scale for three dimensions:
1.  **Valence:** Unhappy (1) to Happy (9).
2.  **Arousal:** Calm (1) to Excited (9).
3.  **Dominance:** Controlled (1) to In Control (9).

### Data Dictionary

While the full dataset contains 65 variables (including ratings split by age and education), this project primarily utilizes the following core variables:

| Variable Name | Original Column | Description | Data Type |
| :--- | :--- | :--- | :--- |
| **Word** | `Word` | The English lemma rated. | String |
| **Valence** | `V.Mean.Sum` | Overall mean valence rating. | Numeric (1-9) |
| **Arousal** | `A.Mean.Sum` | Overall mean arousal rating. | Numeric (1-9) |
| **Dominance** | `D.Mean.Sum` | Overall mean dominance rating. | Numeric (1-9) |
| **Valence SD** | `V.SD.Sum` | Standard deviation of valence ratings (agreement). | Numeric |
| **Arousal SD** | `A.SD.Sum` | Standard deviation of arousal ratings. | Numeric |
| **Dominance SD**| `D.SD.Sum` | Standard deviation of dominance ratings. | Numeric |
| **Male Valence**| `V.Mean.M` | Mean valence rating from male participants. | Numeric (1-9) |
| **Female Valence**| `V.Mean.F` | Mean valence rating from female participants. | Numeric (1-9) |

*Note: Corresponding `.M` (male) and `.F` (female) columns also exist for Arousal (A) and Dominance (D).*