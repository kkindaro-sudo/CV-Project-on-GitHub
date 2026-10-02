# Karen Kindaro CV

This repository contains a data-driven CV created in R Markdown for Part II of Lab 06.

## Repository files

- `index.Rmd` - R Markdown CV template
- `index.html` - rendered CV and GitHub Pages homepage
- `positions.csv` - education and work-experience data
- `parsing_functions.R` - helper functions that convert CSV rows into CV sections
- `css/resume.css` - custom CV styling
- `Karen_Kindaro_CV.Rproj` - RStudio project file

## Render the CV

1. Open `Karen_Kindaro_CV.Rproj` in RStudio.
2. Install the required packages if necessary:

   ```r
   install.packages(c("pagedown", "tidyverse", "glue"))
   ```

3. Open `index.Rmd` and select **Knit**.
4. Confirm that the updated `index.html` appears in the repository root.

## Publish with GitHub Pages

1. Upload or push every file in this folder to the root of your GitHub CV repository.
2. Open **Settings > Pages** in GitHub.
3. Under **Build and deployment**, choose **Deploy from a branch**.
4. Select the `main` branch and `/ (root)` folder, then save.
5. Copy the repository URL and the published GitHub Pages URL for Canvas.
