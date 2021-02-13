#Download accelerameter data

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "UCI_HAR_Dataset", method="curl")
dateDownloaded <- date

library(dplyr)
library(reshape2)

##Read in features dataset
df_features <- read.table("features.txt", header=FALSE)

##Change feature names to descriptive variable names
df_features$V2 <- gsub("Acc", "acceleration_", df_features$V2)
df_features$V2 <- gsub("Gravity", "gravity_", df_features$V2)
df_features$V2 <- gsub("Body", "", df_features$V2)
df_features$V2 <- gsub("Gyro", "gyroscope_", df_features$V2)
df_features$V2 <- gsub("Jerk", "jerk_", df_features$V2)
df_features$V2 <- gsub("Mag", "magnitude_", df_features$V2)

##Read in train and test data sets and combine
df_train <- read.table("X_train.txt", sep="", header=FALSE)
df_test <- read.table("X_test.txt", sep="", header=FALSE)
accelerometer_data <- rbind(df_train, df_test)

##Rename the columns of the data set.
colnames(accelerometer_data) <- c(df_features$V2)

##Read in data on subjects and combine train and test data sets
df_subject_train <- read.table("subject_train.txt", header=FALSE, col.names="subject")
df_subject_test <- read.table("subject_test.txt", header=FALSE, col.names="subject")
df_subject <- rbind(df_subject_train, df_subject_test)

#Read in data on activity labels and combine train and test data sets
activity_train <- read.csv("y_train.txt", header = FALSE, col.names="activity")
activity_test <- read.csv("y_test.txt", header = FALSE, col.names="activity")
activity <- rbind(activity_train, activity_test)

##change activity number codes to descriptive labels
activity$activity <- recode(activity$activity, `1` = "walking", `2` = "walking_upstairs", `3` = "walking_downstairs",
                            `4` = "sitting", `5` = "standing", `6` = "laying")

#Use grepl to find rows for the columns that contain means
##and standard deviations feature names

m <- grepl("-mean", df_features$V2)
s <- grepl("-std", df_features$V2)
f <- grepl("meanFreq()", df_features$V2)

##Retrieve the column names for the columns that have mean and standard deviation data
##Remove meanFrequency column names from dataset.

df_columns <- df_features$V2[(m == TRUE & (f==FALSE)) | (s==TRUE) ]

##select the mean and frequency columns from the data set
accelerometer_data <- accelerometer_data[, (m == TRUE & (f==FALSE)) | (s==TRUE)  ]

##Add columns with subject data and activity data to the data set
accelerometer_data <- cbind(df_subject, activity, accelerometer_data)

##Group by subject and activity and find averages for each variable
tidy_data <- melt(accelerometer_data, id=c("subject", "activity")
)
final_tidy_data <- dcast(tidy_data, subject+activity ~ variable, mean)


