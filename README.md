## Project Description
As part of project requirement in "Getting and Cleaning Data" course, this R code generates tidy data text file based on data collected from  the Samsung Galaxy S smartphone calculating average of all measures by each activity and subjects

In this repository, you find:

* run_analysis.R : the R-code run on the data set
* TidyDataSet.txt : the tidy data set extracted from the original data using run_analysis.R
* CodeBook.md : the CodeBook reference to the variables in TidyDataSet.txt
* README.md : the analysis of the code in run_analysis.R

##Study design and data processing

###Collection of the raw data
The dataset used are obtained from "Human Activity Recognition Using Smartphones Data Set" with full description is available at their website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data linked to from the website represent data collected from the accelerometers from the Samsung Galaxy S smartphone and can be downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

##Creating the tidy datafile(running the code)

####Environment
It's assumed that the dataset is already downloaded and unzip into local working R directory.

`getwd()`
`setwd("C:/Modul3/UCI_HAR_Dataset")`
`list.files()`

####Libraries Used
The libraries used is data.table & dplyr. Installation might be required through `install.package()` if libraries are not loaded.

`library(data.table)`    
`library(dplyr)`

###1. Merges the training and the test sets to create one data set

####Read data tables from files.

`featuresTest<-read.table("test/X_test.txt")`
`activityTest<-read.table("test/Y_test.txt")`
`subjectTest<-read.table("test/subject_test.txt")`

`featuresTrain<-read.table("train/X_train.txt")`
`activityTrain<-read.table("train/Y_train.txt")`
`subjectTrain<-read.table("train/subject_train.txt")`

####Bind correlated data and merge into one data called mergedData using rbind & cbind. Then, check the dimension & header names to verify the merging is done properlly.

`features <- rbind(featuresTest,featuresTrain)`
`activity <- rbind(activityTest,activityTrain)`
`subject <- rbind(subjectTest,subjectTrain)`
`mergedData <- cbind(features,activity,subject)`
`dim(mergedData)`
`names(mergedData)`

###2. Extracts only the measurements on the mean and standard deviation for each measurement.

####This files contain 561 features label

`featuresNames <- read.table("features.txt")`

####We want to exclude meanFreq(). hence we need to grep mean() or std() only. "\\" need to be use because "()" is metacharacter. Then we append observations 562 & 563. Print to check the length of extractFeaturesList is 68 .

`extractFeaturesList<-grep("std\\(\\)|mean\\(\\)",featuresNames$V2) %>% c(562,563)`
`print(extractFeaturesList)`

####Assign only required features of mergedData to the Data

`Data <- mergedData[,extractFeaturesList]`
`head(Data)`

####Update data of featuresNames based on extractFeaturesList only. At the same time, we assigned header name to activity & subject.

`names(Data)<- featuresNames[extractFeaturesList, "V2"]`
`names(Data)[67] <- "activity"`
`names(Data)[68] <- "subject"`

###3. Uses descriptive activity names to name the activities in the data set

####This file contain 6 activities label

`activityNames <- read.table("activity_labels.txt")`

####Check Data$activity data types; integer. Then check Data$activityNames data types; factor

`lapply(Data,class)`
`lapply(activityNames,class)`

####Replace Data$activity with respectives activityNames via looping. Then check updated values to verify the it is done properly(should replace 6 different integer to characters of 6 different activities).

`for (i in 1:6){`
 ` Data$activity[Data$activity == i] <- as.character(activityNames[i,2])`
`}`
`unique(Data$activity)`

####Set back Data$activity data types as factor

`Data$activity <- as.factor(Data$activity)`

###4. Appropriately labels the data set with descriptive variable names. 

####Check for header names. Most of the labelling has been done previously

`names(Data) `

####Clean columns name from "()" parenthesis and hyphens signs. Then, capitalize Mean & STD for readability

`names(Data) <-gsub("\\(|\\)", "", names(Data))`
`names(Data) <-gsub("\\-", ".", names(Data))`
`names(Data)<-gsub("mean", "Mean", names(Data), ignore.case = TRUE)`
`names(Data)<-gsub("std", "STD", names(Data), ignore.case = TRUE)`
`names(Data)`

###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####Set subject as a factor and set Data to data.table type for data manipulation later on

`Data$subject <- as.factor(Data$subject)`
`Data <- data.table(Data)`

####check Data$subject data types; factor

`lapply(Data,class)`

#####Create Tidy Data with average for each activity and subject

`tidyData <- aggregate(. ~subject + activity, Data, mean)`

#####Order Tidy Data according to subject and activity

`tidyData <- tidyData[order(tidyData$subject,tidyData$activity),]`

#####Write tidyData into a text file

`write.table(tidyData, file = "TidyDataSet.txt", row.names = FALSE)`


##Description of the variables in the tiny_data.txt file
General description of the file:
 - Dimensions of the dataset: 10299 x 68
 - Variables present in the dataset: Refer to CodeBook.md in this repository


