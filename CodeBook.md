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

######The header of TidyDataSet.txt has been rename according to Tidy Data rule by replacing parenthesis & hyphens signs: 
activity
subject
tBodyAcc.Mean.X           
tBodyAcc.Mean.Y          
tBodyAcc.Mean.Z           
tBodyAcc.STD.X           
tBodyAcc.STD.Y            
tBodyAcc.STD.Z           
tGravityAcc.Mean.X       
tGravityAcc.Mean.Y      
tGravityAcc.Mean.Z       
tGravityAcc.STD.X        
tGravityAcc.STD.Y         
tGravityAcc.STD.Z        
tBodyAccJerk.Mean.X      
tBodyAccJerk.Mean.Y      
tBodyAccJerk.Mean.Z       
tBodyAccJerk.STD.X       
tBodyAccJerk.STD.Y       
tBodyAccJerk.STD.Z      
tBodyGyro.Mean.X        
tBodyGyro.Mean.Y       
tBodyGyro.Mean.Z         
tBodyGyro.STD.X          
tBodyGyro.STD.Y          
tBodyGyro.STD.Z          
tBodyGyroJerk.Mean.X      
tBodyGyroJerk.Mean.Y     
tBodyGyroJerk.Mean.Z     
tBodyGyroJerk.STD.X     
tBodyGyroJerk.STD.Y      
tBodyGyroJerk.STD.Z     
tBodyAccMag.Mean         
tBodyAccMag.STD         
tGravityAccMag.Mean       
tGravityAccMag.STD       
tBodyAccJerkMag.Mean      
tBodyAccJerkMag.STD      
tBodyGyroMag.Mean        
tBodyGyroMag.STD         
tBodyGyroJerkMag.Mean     
tBodyGyroJerkMag.STD     
fBodyAcc.Mean.X           
fBodyAcc.Mean.Y          
fBodyAcc.Mean.Z          
fBodyAcc.STD.X           
fBodyAcc.STD.Y            
fBodyAcc.STD.Z          
fBodyAccJerk.Mean.X       
fBodyAccJerk.Mean.Y      
fBodyAccJerk.Mean.Z       
fBodyAccJerk.STD.X       
fBodyAccJerk.STD.Y        
fBodyAccJerk.STD.Z       
fBodyGyro.Mean.X          
fBodyGyro.Mean.Y         
fBodyGyro.Mean.Z          
fBodyGyro.STD.X          
fBodyGyro.STD.Y           
fBodyGyro.STD.Z          
fBodyAccMag.Mean          
fBodyAccMag.STD          
fBodyBodyAccJerkMag.Mean  
fBodyBodyAccJerkMag.STD  
fBodyBodyGyroMag.Mean     
fBodyBodyGyroMag.STD     
fBodyBodyGyroJerkMag.Mean 
fBodyBodyGyroJerkMag.STD 


