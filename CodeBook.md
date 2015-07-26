####Description:
This CodeBook is part or project requirement in "Getting and Cleaning Data" course. It describe and indicate all the variables used in run_analysis.R and definitions ofvariables in TidyDataSet.txt

####Dataset Used:
The dataset used are obtained from "Human Activity Recognition Using Smartphones Data Set" with full description is available at their website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data linked to from the website represent data collected from the accelerometers from the Samsung Galaxy S smartphone and can be downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

####Input data:
Input data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The input data inside the zip folder contains following data:

* X_train.txt contains variable features that are intended for training.
* y_train.txt contains the activities corresponding to X_train.txt.
* subject_train.txt contains information on the subjects from whom data is collected.
* X_test.txt contains variable features that are intended for testing.
* y_test.txt contains the activities corresponding to X_test.txt.
* subject_test.txt contains information on the subjects from whom data is collected.
* activity_labels.txt contains metadata on the different types of activities.
* features.txt contains the name of the features in the data sets.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####Output data:
Output text file contains a tidy data set named TidyDataSet.txt; calculating average of std and mean measures grouped by activity and subject. Using run_analysis.R, the input data undergo all this process:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It contains the following data:

######Measures: 
 [1] "tBodyAcc.Mean.X"           "tBodyAcc.Mean.Y"          
 [3] "tBodyAcc.Mean.Z"           "tBodyAcc.STD.X"           
 [5] "tBodyAcc.STD.Y"            "tBodyAcc.STD.Z"           
 [7] "tGravityAcc.Mean.X"        "tGravityAcc.Mean.Y"       
 [9] "tGravityAcc.Mean.Z"        "tGravityAcc.STD.X"        
[11] "tGravityAcc.STD.Y"         "tGravityAcc.STD.Z"        
[13] "tBodyAccJerk.Mean.X"       "tBodyAccJerk.Mean.Y"      
[15] "tBodyAccJerk.Mean.Z"       "tBodyAccJerk.STD.X"       
[17] "tBodyAccJerk.STD.Y"        "tBodyAccJerk.STD.Z"       
[19] "tBodyGyro.Mean.X"          "tBodyGyro.Mean.Y"         
[21] "tBodyGyro.Mean.Z"          "tBodyGyro.STD.X"          
[23] "tBodyGyro.STD.Y"           "tBodyGyro.STD.Z"          
[25] "tBodyGyroJerk.Mean.X"      "tBodyGyroJerk.Mean.Y"     
[27] "tBodyGyroJerk.Mean.Z"      "tBodyGyroJerk.STD.X"      
[29] "tBodyGyroJerk.STD.Y"       "tBodyGyroJerk.STD.Z"      
[31] "tBodyAccMag.Mean"          "tBodyAccMag.STD"          
[33] "tGravityAccMag.Mean"       "tGravityAccMag.STD"       
[35] "tBodyAccJerkMag.Mean"      "tBodyAccJerkMag.STD"      
[37] "tBodyGyroMag.Mean"         "tBodyGyroMag.STD"         
[39] "tBodyGyroJerkMag.Mean"     "tBodyGyroJerkMag.STD"     
[41] "fBodyAcc.Mean.X"           "fBodyAcc.Mean.Y"          
[43] "fBodyAcc.Mean.Z"           "fBodyAcc.STD.X"           
[45] "fBodyAcc.STD.Y"            "fBodyAcc.STD.Z"           
[47] "fBodyAccJerk.Mean.X"       "fBodyAccJerk.Mean.Y"      
[49] "fBodyAccJerk.Mean.Z"       "fBodyAccJerk.STD.X"       
[51] "fBodyAccJerk.STD.Y"        "fBodyAccJerk.STD.Z"       
[53] "fBodyGyro.Mean.X"          "fBodyGyro.Mean.Y"         
[55] "fBodyGyro.Mean.Z"          "fBodyGyro.STD.X"          
[57] "fBodyGyro.STD.Y"           "fBodyGyro.STD.Z"          
[59] "fBodyAccMag.Mean"          "fBodyAccMag.STD"          
[61] "fBodyBodyAccJerkMag.Mean"  "fBodyBodyAccJerkMag.STD"  
[63] "fBodyBodyGyroMag.Mean"     "fBodyBodyGyroMag.STD"     
[65] "fBodyBodyGyroJerkMag.Mean" "fBodyBodyGyroJerkMag.STD" 
[67] "activity"                  "subject"
