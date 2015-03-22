# Getting and Cleaning Data - Course Project


This script (run_analysis.R) works with data collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data used for the project is available in: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To get the results of the analysis follow the next steps:

* unzip the data and copy it with the run_analysis.R file to your working directory.
* run the script, which produces two files: tidyData.txt and tidyData-Means.txt
 * tidyData.txt contains the cleaned, merged and labeled data from the test and train sets
 * tidyDataMeans.txt contains the cleaned mean and std data.

# CodeBook

Description of the data: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data used: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Script Algorithm
* Read train and test files, including the data, the labels and the subjects for each experiment
* Merge corresponding data from each file
* Read the features to get te description of each measurement
* Get indexes that corresponds to mean or std from the merged data
* Read the names of the measured activities
* Label the merged data with the proper names from the features file
* Output the first file - tiDyData.txt

* Sort the Subject ids ad activity names, getting rid of repetitions
* Get a subset of the original data for each subject within each activity and add the mean to a new matrix
* Rename the columns properly
* Output the second file - tidyData-Means.txt