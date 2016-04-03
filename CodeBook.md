# Getting and Cleaning Data Course Project -- CodeBook
> The objective of the project is to create a tidy data that can be used for later analysis.
# Data Source
> The data used for analysis comes from the link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Data Description
## Dataset Information
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
## Attribute Information
> For each record in the dataset it is provided: 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.
>
> To get more detailed description, you could load into the following web:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Data Getting and Cleaning
> In order to get the tidy data as required, we run run_analysis.r script to perform steps as below:
> - 1. Download Data
>
> Download the zipped data from the source given above to the current working directory, and unzipped it to get the folder "UCI HAR Dataset", there are four .txt files:
>
> 'README.txt'
>
> 'features_info.txt': Shows information about the variables used on the feature vector.
>
> 'features.txt': List of all features.
>
> 'activity_labels.txt': Links the class labels with their activity name.
>
>contained in this folder, and two more folders 'test' and 'train' are contained as well. Take a further looking at those two folders, the descriptions of the files contained in either one of them are similar. Take the folder 'train' for instance, it has:
>
>'X_train.txt': Training set.
>
>'y_train.txt': Training labels.
>
> 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
>
>- 2. Merges the training and the test sets to create one data set
>
> Load 'subject_test.txt', 'X_test.txt','y_test' from the folder and store them in the dataset subject_test, x_test, y_test seperately.And combine them by columns to get a new dataset test.
>
>Load 'subject_train.txt', 'X_train.txt','y_train' from the folder and store them in the dataset subject_train, x_train, y_train seperately. And combine them by columns to obtain a new dataset train.
>
>Load ‘features.txt’ and store it in the dataset features, change the variable names of dataset x_train and x_test with the values of the second column value in features.
>
> Concatenate the dataset test and train by rows to obtain a new data set MergeData.
>
>- 3.Extracts only the measurements on the mean and standard deviation for each measurement
>
> Store the results in the dataset MergeData_mean_std and rename the variable names. Change the name of the last variable in the data set MergeData to "ActivityLabels".
>
>- 4. Appropriately labels the data set with descriptive variable names.
>
> Replace the prefix 't' with 'time' and the prefix 'f' with 'frequency'
>
> Change the words 'Acc', 'Gyro', 'Mag' to 'Acceleration', 'Gyroscope', 'Magnitude' correspondingly.
>
> Remove the parenthesis '()' and edit the first variable name as 'Subject'
>
>- 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
>
> Melt data then treat variables "Subject" and "ActivityLabels" as the variables that identify individual rows of data. 
>
> Calculate the mean value of each variable for each activity and each subject, store the outcome in the dataset 'sec_data'
>
> Output the results in the dataset 'sec_data' into the file 'SecondCleanedDataset.txt'
