## Project Description
As part of project requirement in "Getting and Cleaning Data" course, this R code generates tidy data text file based on data collected from  the Samsung Galaxy S smartphone calculating average of all measures by each activity and subjects

In this repository, you find:

* run_analysis.R : the R-code run on the data set
* Tidy.txt : the clean data extracted from the original data using run_analysis.R
* CodeBook.md : the CodeBook reference to the variables in Tidy.txt
* README.md : the analysis of the code in run_analysis.R

##Study design and data processing

###Collection of the raw data
The dataset used are obtained from "Human Activity Recognition Using Smartphones Data Set" with full description is available at their website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data linked to from the website represent data collected from the accelerometers from the Samsung Galaxy S smartphone and can be downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

##Creating the tidy datafile(running the code)

####Environment
It's assumed that the dataset is already downloaded and unzip into local working R directory

`getwd()`
`setwd("C:/Modul3/UCI_HAR_Dataset")`
`list.files()`

####Libraries Used
The libraries used is data.table & dplyr. Installation might be required through `install.package()` if libraries are not loaded.

`library(data.table)`    
`library(dplyr)`

###1. Merges the training and the test sets to create one data set

####Read data tables from files
`featuresTest<-read.table("test/X_test.txt")`
`activityTest<-read.table("test/Y_test.txt")`
`subjectTest<-read.table("test/subject_test.txt")`

`featuresTrain<-read.table("train/X_train.txt")`
`activityTrain<-read.table("train/Y_train.txt")`
`subjectTrain<-read.table("train/subject_train.txt")`

####Bind correlated data and merge into one data called mergedData using rbind & cbind. Then, check the dimension & header names to verify the merging is done properlly

`features <- rbind(featuresTest,featuresTrain)`
`activity <- rbind(activityTest,activityTrain)`
`subject <- rbind(subjectTest,subjectTrain)`
`mergedData <- cbind(features,activity,subject)`
`dim(mergedData)`
`names(mergedData)`

###2. Extracts only the measurements on the mean and standard deviation for each measurement.

####This files contain 561 features label

`featuresNames <- read.table("features.txt")`

####We want to exclude meanFreq(). hence need to grep mean() or std() only. "\\" need to be use because "()" is metacharacter. Then we append observations 562 & 563. Print to check the value is right.

`extractFeaturesList<-grep("std\\(\\)|mean\\(\\)",featuresNames$V2) %>% c(562,563)`
`print(extractFeaturesList)`

##assign only wanted features to new featuresData
Data <- mergedData[,extractFeaturesList]
head(Data)
##update data for featuresNames based on extractFeaturesList only
names(Data)<- featuresNames[extractFeaturesList, "V2"]
names(Data)[67] <- "activity"
names(Data)[68] <- "subject"



####



##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset


