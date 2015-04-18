## This script is used to prepare tidy data that can be used for later analysis.

setwd("./UCI HAR Dataset/")

## merge the training and test sets to create one data set

train_data <- read.table("./train/X_train.txt")
test_data <- read.table("./test/X_test.txt")
data <- rbind(train_data,test_data)

## read the labels of all the measurements conducted in the experiments

features <- read.table("./features.txt")

## read and merge the identifiers of the subjects who carried out the 
## experiments in the training and test data sets

train_subject <- read.table("./train/subject_train.txt")
test_subject <- read.table("./test/subject_test.txt")
subject <- rbind(train_subject,test_subject)

## read and merge the numeric labels of the activities
## in the training and test data sets

train_activity <- read.table("./train/y_train.txt")
test_activity <- read.table("./test/y_test.txt")
activity_num <- rbind(train_activity,test_activity)

## change the numeric activity labels to labels of descriptive characters

library(plyr)
activity <- revalue(factor(activity_num$V1), c("1"="walking",
                                               "2"="walking_upstairs",
                                               "3"="walking_downstairs",
                                               "4"="sitting","5"="standing",
                                               "6"="laying"))

## set the column names of the training and test data set to 
## the labels of all the measurements 

colnames(data) <- features$V2

## extracts only the measurements on the mean and standard deviation 
## for each measurement

mean_std_measure <- grep("mean\\(\\)|std\\(\\)",colnames(data))
data_mean_std <- data[,mean_std_measure]

## add subject and activity columns to the head of the data set 
## to form the final tidy data set

data_tidy <- cbind(subject = subject$V1,activity = activity,data_mean_std)

## create a two level factor used to split the tidy data set into 
## each activity of each subject

f <- interaction(factor(data_tidy$subject),activity,lex.order=T)
s <- split(data_tidy,f)

## calculate the mean values of each measurement 
## for each activity of each subject

data_m <- sapply(s,function(x) colMeans(x[,3:ncol(data_tidy)]))

## transpose the matrix of data_m and tranform it into data frame

data_mean <- as.data.frame(t(data_m))

## remove the row names

rownames(data_mean) <- NULL

## add the subject and activity columns to the head of the data set
## to form the final tidy data set with the mean values of each measurement 
## for each activity of each subject

data_tidy_mean <- cbind(subject=rep(1:30,each=6),activity=c("walking",
                                                    "walking_upstairs",
                                                    "walking_downstairs",
                                                    "sitting","standing",
                                                    "laying"),
                        data_mean)

write.table(data_tidy_mean,file="./data_tidy_mean.txt",row.names=F)