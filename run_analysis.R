
library(data.table)

library(dplyr)

## download and unzip file.

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileURL, "smartphone.zip")

unzip("smartphone.zip")  

##  read the 6 data files into separate datatables.

ytest <- fread("UCI HAR Dataset/test/y_test.txt", sep = " ", header = FALSE, 
               colClasses = "numeric")

Xtest <- fread("UCI HAR Dataset/test/X_test.txt", sep = " ", header = FALSE,
               colClasses = "numeric")

subjecttest <- fread("UCI HAR Dataset/test/subject_test.txt", sep = " ",
                     header = FALSE)

ytrain <- fread("UCI HAR Dataset/train/y_train.txt", sep = " ", header = FALSE, 
                colClasses = "numeric")

Xtrain <- fread("UCI HAR Dataset/train/X_train.txt", sep = " ", header = FALSE, 
                colClasses = "numeric")

subjecttrain <- fread("UCI HAR Dataset/train/subject_train.txt", sep = " ", 
                      header = FALSE)

## combine data into one large data.table.

SPdata <- cbind(rbind(subjecttest, subjecttrain), rbind(ytest, ytrain), 
                rbind(Xtest, Xtrain))

## read the data features from file and assign column names to data.table.

xcolnames <- fread("UCI HAR Dataset/features.txt", header = FALSE, colClasses 
                   = c("numeric", "character"))

SPcolnames <- c("patient", "activity", xcolnames[, V2])

colnames(SPdata) <- SPcolnames

## subset the desired data columns.

SPdata_small <- SPdata[, grepl("patient|activity|mean|std", SPcolnames), 
                       with = FALSE]

##  replace activity names with human readable labels.

actkey <- fread("UCI HAR Dataset/activity_labels.txt", header = FALSE, 
                colClasses = c("numeric", "character"), sep= " ")

colnames(actkey) <- c("activity", "activity_name")

SPdata_small <- (left_join(SPdata_small, actkey))

SPdata_small$activity <- SPdata_small$activity_name

SPdata_small <- SPdata_small[, activity_name := NULL]

## create a tidy dataset of the mean of all variables (with "mean" or "std").

tidy <- SPdata_small[, lapply(.SD, mean), by = .(patient, activity), 
                  .SDcols = 3:ncol(SPdata_small)]

colnames(tidy)[3:ncol(tidy)] <- paste("mean", colnames(tidy)[3:ncol(tidy)])

## arrange and save the final tidy dataset.

tidy <- arrange(tidy, patient, activity)

write.table(tidy, "tidy_data.txt", row.names = FALSE)