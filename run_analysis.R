run_analysis <- function() {
        # download file and record date if not already there
        source("read_file.R")
        read_file()
        
        # read in data
        features <- read.table("./UCI\ HAR\ Dataset/features.txt", stringsAsFactors = FALSE)
        train <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt", sep = "", col.names = features$V2)
        train.y <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
        train.sub <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")
        test <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt", sep = "", col.names = features$V2)
        test.y <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt")
        test.sub <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")
        act <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt")
        
        # rename variables, get rid of "(", ")" and "-"
        features$V2 <- gsub("(", "", features$V2, fixed = TRUE)
        features$V2 <- gsub(")", "", features$V2, fixed = TRUE)
        features$V2 <- gsub("-", "", features$V2, fixed = TRUE)
        
        # create one table with everything
        y <- rbind(train.y, test.y)
        sub <- rbind(train.sub, test.sub)
        data1 <- rbind(train, test)
        data <- cbind(data1, sub, y)
        names(data) <- append(features$V2, c("subject", "activity"))
        
        
        # extract mean and std
        #ms <- c(1:6,41:46,81:86,121:127,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,515:517,526,529:530,539,542:543,552,555:561)
        ms <- c(1:6,41:46,81:86,121:127,161:166,266:271,345:350,424:429,562,563)
        ms_data <- data[,ms]
        mms_data = merge(ms_data, act, by.x = "activity", by.y = "V1")
        mms_data <- mms_data[,-1]
        names(mms_data)[51] <- "activity"
        
        # break down for activity and subject
        library(dplyr)
        actab <- group_by(mms_data, activity, subject)
        result <- summarize(actab, mean(tBodyAccmeanX), mean(tBodyAccmeanY), mean(tBodyAccmeanZ), mean(tBodyAccstdX), mean(tBodyAccstdY), mean(tBodyAccstdZ), mean(tGravityAccmeanX), mean(tGravityAccmeanY), mean(tGravityAccmeanZ), mean(tGravityAccstdX), mean(tGravityAccstdY), mean(tGravityAccstdZ), mean(tBodyAccJerkmeanX), mean(tBodyAccJerkmeanY), mean(tBodyAccJerkmeanZ), mean(tBodyAccJerkstdX), mean(tBodyAccJerkstdY), mean(tBodyAccJerkstdZ), mean(tBodyGyromeanX), mean(tBodyGyromeanY), mean(tBodyGyromeanZ), mean(tBodyGyrostdX), mean(tBodyGyrostdY), mean(tBodyGyrostdZ), mean(tBodyGyromadX), mean(tBodyGyroJerkmeanX), mean(tBodyGyroJerkmeanY), mean(tBodyGyroJerkmeanZ), mean(tBodyGyroJerkstdX), mean(tBodyGyroJerkstdY), mean(tBodyGyroJerkstdZ), mean(fBodyAccmeanX), mean(fBodyAccmeanY), mean(fBodyAccmeanZ), mean(fBodyAccstdX), mean(fBodyAccstdY), mean(fBodyAccstdZ), mean(fBodyAccJerkmeanX), mean(fBodyAccJerkmeanY), mean(fBodyAccJerkmeanZ), mean(fBodyAccJerkstdX), mean(fBodyAccJerkstdY), mean(fBodyAccJerkstdZ), mean(fBodyGyromeanX), mean(fBodyGyromeanY), mean(fBodyGyromeanZ), mean(fBodyGyrostdX), mean(fBodyGyrostdY), mean(fBodyGyrostdZ))
        View(result)
        
        # write to file
        write.table(result, "result.txt", row.names = FALSE)
}