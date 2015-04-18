## Workflow of the Script
The run_analysis.R file prepares tidy data that can be used for later analysis:  
1. set "./UCI HAR Dataset/" as the working directory  
2. read training data from "./train/x\_train.txt"  
3. read test data from "./test/X\_test.txt"  
4. merge the training and test sets to create one data set  
5. read the labels of all the measurements conducted in the experiments from "./features.txt"  
6. read and merge the identifiers of the subjects who carried out the experiments in the training and test data sets from "./train/subject\_train.txt" and "./test/subject\_test.txt"  
7. read and merge the numeric labels of the activities
in the training and test data sets from "./train/y\_train.txt" and "./test/y\_test.txt"  
8. change the numeric activity labels to labels of descriptive characters  
9. set the column names of the training and test data set to the labels of all the measurements  
10. extracts only the measurements on the mean and standard deviation for each measurement  
11. add subject and activity columns to the head of the data set to form the final tidy data set (data frame): data\_tidy
  
The second tidy data set with the average of each variable for each activity of each subject is created through the following steps:  
1. create a two level factor used to split the tidy data set into each activity of each subject  
2. calculate the mean values of each measurement for each activity of each subject  
3. add the subject and activity columns to the head of the data set to form the final tidy data set with the mean values of each measurement for each activity of each subject (data frame): data\_tidy\_mean and write it to "./data\_tidy\_mean.txt" with no row names