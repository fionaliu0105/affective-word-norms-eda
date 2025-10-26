## Datasets

### Data Directory

This directory contains the raw data used for the project, sourced from Google's "The Quick, Draw! Dataset."

### Dataset Citation

Dataset: The Quick, Draw! Dataset

Source: [Google Creative Lab GitHub](https://github.com/googlecreativelab/quickdraw-dataset)

License: Creative Commons Attribution 4.0 International License.

### Files

This analysis uses the "simplified" drawing files, which are provided in a newline-delimited JSON format. Each line is a JSON object representing a single drawing.

The files used in this analysis are:

-   `full_simplified_apple.ndjson`

-   `full_simplified_chair.ndjson`

-   `full_simplified_dolphin.ndjson`

### IMPORTANT: Download Instructions

These files are large (45MB - 75MB each) and are intentionally not tracked by Git (they are listed in the .gitignore file).

To reproduce the analysis, you must download the files directly from the Google Cloud Storage bucket linked in the official repository.

Download Links:

-   Apple: <https://storage.googleapis.com/quickdraw_dataset/simplified/apple.ndjson>

-   Chair: <https://storage.googleapis.com/quickdraw_dataset/simplified/chair.ndjson>

-   Dolphin: <https://storage.googleapis.com/quickdraw_dataset/simplified/dolphin.ndjson>

Download these files and place them in this /data directory.
