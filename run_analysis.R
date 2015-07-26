#set working directory
getwd()
setwd("C:/Modul3/UCI_HAR_Dataset")
list.files()

#load libraries
library(dplyr)
library(data.table)

#1. Merges the training and the test sets to create one data set

##load data
featuresTest<-read.table("test/X_test.txt")
activityTest<-read.table("test/Y_test.txt")
subjectTest<-read.table("test/subject_test.txt")

featuresTrain<-read.table("train/X_train.txt")
activityTrain<-read.table("train/Y_train.txt")
subjectTrain<-read.table("train/subject_train.txt")

##bind correlated data
features <- rbind(featuresTest,featuresTrain)
activity <- rbind(activityTest,activityTrain)
subject <- rbind(subjectTest,subjectTrain)

##merged into one data
mergedData <- cbind(features,activity,subject)
dim(mergedData)
names(mergedData)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

##This txt contain 561 features label
featuresNames <- read.table("features.txt")
##we want to exclude meanFreq(). hence need to grep mean() or std() only. "\\" need to be use because "()" is metacharacter then append obs 562 & 563
extractFeaturesList<-grep("std\\(\\)|mean\\(\\)",featuresNames$V2) %>% c(562,563)
print(extractFeaturesList)
##assign only wanted features to new featuresData
Data <- mergedData[,extractFeaturesList]
head(Data)
##take featuresNames based selected on extractFeaturesList only
names(Data)<- featuresNames[extractFeaturesList, "V2"]
names(Data)[67] <- "activity"
names(Data)[68] <- "subject"
  
#3. Uses descriptive activity names to name the activities in the data set
##This txt contain 6 activities label
activityNames <- read.table("activity_labels.txt")
##check Data$activity data types; integer
lapply(Data,class)
##check Data$activity data types; factor
lapply(activityNames,class)

##Replace Data$activity with activity names
for (i in 1:6){
  Data$activity[Data$activity == i] <- as.character(activityNames[i,2])
}
unique(Data$activity)
##set back Data$activity data types; factor
Data$activity <- as.factor(Data$activity)

#4. Appropriately labels the data set with descriptive variable names. 

##Most of the labelling have been done previously
names(Data) 
##clean columns name from "()" parenthesis signs & Capitalize Mean & STD
names(Data) <-gsub("\\(|\\)", "", names(Data))
names(Data) <-gsub("\\-", ".", names(Data))
names(Data)<-gsub("mean", "Mean", names(Data), ignore.case = TRUE)
names(Data)<-gsub("std", "STD", names(Data), ignore.case = TRUE)
names(Data) 

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
head(Data)
group_by(Data,activity)
#Set the subject variable in the data as a factor

Data$subject <- as.factor(Data$subject)
Data <- data.table(Data)
##check Data$activity data types; integer
lapply(Data,class)

#Create tidyData as a set with average for each activity and subject
tidyData <- aggregate(. ~subject + activity, Data, mean)

#Order tidayData according to subject and activity
tidyData <- tidyData[order(tidyData$subject,tidyData$activity),]

#Write tidyData into a text file
write.table(tidyData, file = "TidyDataSet.txt", row.names = FALSE)
