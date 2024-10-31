# Human Activity Recognition Using Smartphones Data Analysis

This project demonstrates the ability to collect, work with, and clean a dataset related to human activity recognition using smartphones. The goal is to prepare tidy data that can be used for later analysis.

## Project Overview

The dataset is collected from the accelerometers from the Samsung Galaxy S smartphone and is part of a research project to recognize human activities (walking, sitting, standing, etc.). 

The following tasks are performed in this project:

1. Merging the training and test sets to create one dataset.
2. Extracting measurements on the mean and standard deviation for each measurement.
3. Using descriptive activity names to name the activities in the dataset.
4. Appropriately labeling the dataset with descriptive variable names.
5. Creating a tidy dataset with the average of each variable for each activity and each subject.

## Files Included

- **run_analysis.R**: R script that performs the data processing tasks.
- **CodeBook**: A code book that describes the variables, the data, and any transformations performed.

## Installation

To run this project, you will need to have R and the `dplyr` package installed. You can install `dplyr` by running the following command in R:

```r
install.packages("dplyr")
