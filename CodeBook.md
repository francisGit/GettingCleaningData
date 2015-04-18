## Data Code Book
The data used in the script represent data collected from the accelerometers from the Samsung Galaxy S smartphone in a set of experiments.  
  
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  
  
The two final tidy data sets are created through the following steps:  
1. merges the training and the test sets to create one data set  
2. extracts only the measurements on the mean and standard deviation for each measurement  
3. uses descriptive activity names to name the activities in the data set  
4. appropriately labels the data set with descriptive variable names   
5. from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject  
  
No row names are defined, column names are defined as follows:  
- subject: integer, an identifier of the subject who carried out the experiment, 1-30  
- activity: factor, descriptive characters of activities, "walking", "walking\_upstairs", "walking\_downstairs", "sitting", "standing", "laying"  
- other columns: numeric, the measurements on the mean and standard deviation for each measurement