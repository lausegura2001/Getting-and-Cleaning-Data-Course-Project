
# CodeBook 

## Description of the dataset

This dataset is extrated from the paper "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The features selected for this database (see features.txt) come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These temporal domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered 
using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and 
tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

## Features selected

The assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement." 
Thus, only the pair of variables with a mean and the respective standar deviation (mean() and std()) were selected. 

The resulting variable names are of the following form: tbodyacc_mean_x, which means the mean value of tBodyAcc-XYZ.
