---
title: "CodeBook for Coursera: Getting and Cleaning Data Project"
date: "2015-11-13"
---
      
## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

## Study design and data processing

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Additional information on the dataset can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Note that the UNITS for these measurements are: standard gravity units 'g'.

## Creating the tidy datafile

### Variables

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Activities:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

### Steps to create the tidy data fie.

- Download the file and unzip.
- Read the 6 data files into separate data.tables.
      (X_test.txt)
      (y_test.txt)
      (subject_test.txt)
      (X_train.txt)
      (y_train.txt)
      (subject_train.txt)
- Combine the 6 data.tables into 1 large data.table.
- Read the data features from a file (features.txt) and assign column names to data.table.
- Subset the desired data columns (only "mean" and "std").
- Replace the activity names with human readable labels from file (activity_labels.txt).
- Create a tidy dataset of the mean of all variables (with "mean" or "std").
- Arrange and save the final tidy dataset (tidy_data.txt).
      
### Tidy data file description

The final tidy data file is a text file named "tidy_data.txt".  The file separator is a single space (sep = " ").  The overall dimensions of this file are 180 rows with 81 columns.

Note that the UNITS for these measurements are: standard gravity units 'g'.

Please note that additional information on the original dataset can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Software configuration:

Session info ------------------------------------------------------
 setting  value                       
 version  R version 3.2.1 (2015-06-18)
 system   i386, mingw32               
 ui       RStudio (0.99.484)          
 language (EN)                        
 collate  English_United States.1252  
 tz       America/Los_Angeles         
 date     2015-11-13                  

Packages ----------------------------------------------------------
 package    * version date       source        
 assertthat   0.1     2013-12-06 CRAN (R 3.2.2)
 chron        2.3-47  2015-06-24 CRAN (R 3.2.2)
 data.table * 1.9.6   2015-09-19 CRAN (R 3.2.2)
 DBI          0.3.1   2014-09-24 CRAN (R 3.2.2)
 devtools     1.9.1   2015-09-11 CRAN (R 3.2.2)
 digest       0.6.8   2014-12-31 CRAN (R 3.2.1)
 dplyr      * 0.4.3   2015-09-01 CRAN (R 3.2.2)
 lazyeval     0.1.10  2015-01-02 CRAN (R 3.2.2)
 magrittr     1.5     2014-11-22 CRAN (R 3.2.1)
 memoise      0.2.1   2014-04-22 CRAN (R 3.2.1)
 R6           2.1.0   2015-07-04 CRAN (R 3.2.1)
 Rcpp         0.12.1  2015-09-10 CRAN (R 3.2.2)
