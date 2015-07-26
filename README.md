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

##Creating the tidy datafile

###Guide to create the tidy data file
####Environment
It's assumed that the dataset is already downloaded and unzip into local working R directory

####Libraries Used
The libraries used is data.table & dplyr. Installation might be required through `install.package()` if libraries are not loaded.
`library(data.table)`    
`library(dplyr)`

####Libraries Used




##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset


