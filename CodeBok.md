# CodeBook

## summary of data manipulation
* removes special characters from feature names
* add new variables activity and subject
* creates one data frame out of train, test, y and subject
* creates new data frame with reduced number of features (mean and std)
* creates new data set with dplyr summarize function for 

## list of variables
* activity
* subject

### Means of all accelerometer / gyroscope variables that are the mean of standard deviation of a measurement:
mean(tBodyAccmeanX), mean(tBodyAccmeanY), mean(tBodyAccmeanZ), mean(tBodyAccstdX), mean(tBodyAccstdY), mean(tBodyAccstdZ), mean(tGravityAccmeanX), mean(tGravityAccmeanY), mean(tGravityAccmeanZ), mean(tGravityAccstdX), mean(tGravityAccstdY), mean(tGravityAccstdZ), mean(tBodyAccJerkmeanX), mean(tBodyAccJerkmeanY), mean(tBodyAccJerkmeanZ), mean(tBodyAccJerkstdX), mean(tBodyAccJerkstdY), mean(tBodyAccJerkstdZ), mean(tBodyGyromeanX), mean(tBodyGyromeanY), mean(tBodyGyromeanZ), mean(tBodyGyrostdX), mean(tBodyGyrostdY), mean(tBodyGyrostdZ), mean(tBodyGyromadX), mean(tBodyGyroJerkmeanX), mean(tBodyGyroJerkmeanY), mean(tBodyGyroJerkmeanZ), mean(tBodyGyroJerkstdX), mean(tBodyGyroJerkstdY), mean(tBodyGyroJerkstdZ), mean(fBodyAccmeanX), mean(fBodyAccmeanY), mean(fBodyAccmeanZ), mean(fBodyAccstdX), mean(fBodyAccstdY), mean(fBodyAccstdZ), mean(fBodyAccJerkmeanX), mean(fBodyAccJerkmeanY), mean(fBodyAccJerkmeanZ), mean(fBodyAccJerkstdX), mean(fBodyAccJerkstdY), mean(fBodyAccJerkstdZ), mean(fBodyGyromeanX), mean(fBodyGyromeanY), mean(fBodyGyromeanZ), mean(fBodyGyrostdX), mean(fBodyGyrostdY), mean(fBodyGyrostdZ))
