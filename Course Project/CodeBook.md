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