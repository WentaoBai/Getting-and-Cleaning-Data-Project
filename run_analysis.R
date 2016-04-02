##Part 1. Merges the training and the test sets to create one data set
setwd("~/Desktop/Coursera/Getting and Cleaning Data")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") #load subject_test.txt
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")             #load X_test.txt
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")             #load y_test.txt

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #load subject_train.txt
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")             #load X_train.txt
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")             #load y_train.txt

features <- read.table("./UCI HAR Dataset/features.txt")    #load features.txt
colnames(x_train) <- features[,2] 
#change variable names of x_train with the second column value of the data set features

colnames(x_test) <- features[,2]
#change variable names of x_test with the second column value of the data set features

test <- cbind(subject_test, x_test, y_test)
train <- cbind(subject_train, x_train, y_train)
MergeData <- rbind(test,train) 
#Cannot apply cbind to data sets test and train, since they have different number of rows

#Part 2. Extracts only the measurements on the mean and standard deviation for each measurement
MergeData_mean_std <- MergeData[,(grep("-mean\\(\\)|-std\\(\\)",features[,2])+1)]
#Thanks to the construction of MergeData, the second colomn of it is actually the 
#first column of the data set features, etc.
head(MergeData_mean_std)
names(MergeData_mean_std) <- features[(grep("-mean\\(\\)|-std\\(\\)",features[,2])+1),2]
head(MergeData_mean_std)

#Part3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
MergeData[,dim(MergeData)[2]] <- activity_labels[MergeData[,dim(MergeData)[2]],2]
#dim()[2] here could help me count the total number of columns MergeData has
head(MergeData[,dim(MergeData)[2]])
names(MergeData)[dim(MergeData)[2]] <- "ActivityLabels"

#Part4. Appropriately labels the data set with descriptive variable names.
names(MergeData)<-gsub("^t", "time", names(MergeData))
names(MergeData)<-gsub("^f", "frequency", names(MergeData))
names(MergeData)<-gsub("Acc", "Acceleration", names(MergeData))
names(MergeData)<-gsub("Gyro", "Gyroscope", names(MergeData))
names(MergeData)<-gsub("Mag", "Magnitude", names(MergeData))
names(MergeData)<-gsub("\\(\\)","",names(MergeData))
names(MergeData)[1] <- "Subject"
names(MergeData)

#Part5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
MergeDataMelt <- melt(MergeData,id=c("Subject","ActivityLabels"))
#Melt data, treat variales "Subject" and "ActivityLabels" as the variables that 
#identify individual rows of data
sec_data <- dcast(MergeDataMelt, Subject+ActivityLabels~variable, mean)
head(sec_data)
