## Basic repo setup for final project

[/data] contains data.

### Project Description

This project explores the "Quick, Draw!" dataset, a collection of 50 million drawings from the Google game of the same name. The goal is to analyze the vector-based drawing data to understand how people conceptually represent and visually communicate common objects.

This analysis will focus on three distinct categories: `apple`, `chair`, and `dolphin`. By "tidying" the nested JSON data, this project will explore drawing patterns, stroke order, and complexity to see if measurable differences exist between these categories (e.g., natural vs. man-made objects).

### Repository Structure

`Liu_Fiona_progress_memo_1.qmd`: Quarto file for the first progress memo.

`Liu_Fiona_progress_memo_1.html`: Rendered HTML version of the first memo.

`*.Rproj`: The R project file for managing the workspace.

`/data`: This folder contains (or will contain) the raw data. See the data/README.md for crucial information on data sources and download links.

### Datasets

The data for this project is sourced from the "The Quick, Draw! Dataset," a public collection by Google. Full citation, license, and download instructions are located in the `data/README.md` file.

Note: The raw `.ndjson` data files are large (over 170MB total) and are listed in the `.gitignore` file. They are not committed to this repository. The analysis reports (`.html` files) are rendered using a 10,000-drawing random sample from each category.
