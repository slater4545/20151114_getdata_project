"README file for my ""Coursera: Getting and Cleaning Data Project"""
date: 2015-11-13

There are 2 files associated with this project:

1)  codebook.md
Provides a complete description of the study design and data analysis procedure performed with R script.


2)  run_analysis.R
The script used to created the tidy data file.  
"This includes the entire process from downloading the data file, full data analysis, and saves a tidy data file (tidy_data.txt)."
"Please, note that this script requires the following two libraries to be installed (""data.table"" and ""dplyr"")."
Just run the script and everything is automatically performed.  Nothing else is needed from the user.
The output file (tidy_data.txt) will be saved in the working directory.

This script will do the following steps:
Download the file and unzip.
Read the 6 data files into separate data.tables.
(X_test.txt)
(y_test.txt)
(subject_test.txt)
(X_train.txt)
(y_train.txt)
(subject_train.txt)
Combine the 6 data.tables into 1 large data.table.
Read the data features from a file (features.txt) and assign column names to data.table.
"Subset the desired data columns (only ""mean"" and ""std"")."
Replace the activity names with human readable labels from file (activity_labels.txt).
"Create a tidy dataset of the mean of all variables (with ""mean"" or ""std"")."
Arrange and save the final tidy dataset (tidy_data.txt).
