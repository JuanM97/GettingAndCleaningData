
setwd("D:/R/Getting and Cleaning Data")

#Reading Train files
# Train set
TrainSet = read.table("D:/R/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt")
#head(TrainSet)
dim(TrainSet)
TrainLabels = read.table("D:/R/Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt")
#head(TrainLabels)
dim(TrainLabels)
TrainSubject = read.table("D:/R/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt")
#head(TrainSubject)
dim(TrainSubject)
# Reading Test files
#Test set
TestSet = read.table("D:/R/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt")
#head(TestSet)
dim(TestSet)
TestLabels = read.table("D:/R/Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt")
#head(TestLabels)
dim(TestLabels)
TestSubject = read.table("D:/R/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt")
#head(TestSubject)
dim(TestSubject)

# 1. Merges the training and the test sets to create one data set.
DataMerged = rbind(TrainSet,TestSet)
dim(DataMerged)

LabelsMerged = rbind(TrainLabels,TestLabels)
dim(LabelsMerged)

SubjectMerged = rbind(TrainSubject,TestSubject)
dim(SubjectMerged)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features = read.table("D:/R/Getting and Cleaning Data/UCI HAR Dataset/features.txt")
dim(features)

idxM = grep("mean\\(\\)",features[,2])
idxS = grep("std\\(\\)",features[,2])
idxMS = c(idxM,idxS)
dim(idxMS)
# MS = Mean&Std
DataMergedMS = DataMerged[,idxMS]
dim(DataMergedMS)

# 3. Uses descriptive activity names to name the activities in the data set

activityLabels = read.table("D:/R/Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt")

ActLabels = activityLabels[LabelsMerged[,1],2]


# 4. Appropriately labels the data set with descriptive variable names. 
featLabels = features[idxMS,2]
colNames = c("Subject","Activity",as.character(featLabels))
TidyData = cbind(SubjectMerged,ActLabels,DataMergedMS)
colnames(TidyData) = colNames
dim(TidyData)

write.table(TidyData,"D:/R/Getting and Cleaning Data/tidyData.txt")


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

subjects = sort(unique(SubjectMerged[,1]))
activities = unique(ActLabels)

lenSub = length(subjects)
lenAct = length(activities)

DataMeans=0;
for(i in 1:lenAct){
  for(j in 1:lenSub){
    newSub = TidyData[TidyData$Subject == j,]
    newSA = newSub[newSub$Activity == activities[i],]
    newRow = c(as.character(activities[i]),subjects[j],
               colMeans(newSA[,3:length(newSA)]))
    DataMeans = rbind(DataMeans,newRow)
  }
}
DataMeans=DataMeans[-1,]
rownames(DataMeans)=NULL
colnames(DataMeans) = c("Activity","Subject",colnames(DataMeans)[3:length(colnames(DataMeans))])
head(DataMeans)
write.table(DataMeans,"D:/R/Getting and Cleaning Data/tidyData-Means.txt")
write.table(DataMeans,"D:/R/Getting and Cleaning Data/tidyData-Means2.txt",row.name=F)



