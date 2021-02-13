## Getting_and_cleaning_data_final_project

This repository contains the final project for the Coursera Getting and Clean Data course.

The purpose of this project was to demostrate the ability to create a tidy data set. The data for the project is the Human Activity Recognition Using Smartphones Dataset, verson 1. The data came from a group of 30 volunteers, aged 19-48, who performed six different activities while wearing a Samsung Galaxy S II on their waist. This yielded acceleromenter and angular velocity sensor signals. The raw data was then passed through a noise filter and a Butterworth low-pass filter was used to separate the signals into acceleration and gravity components. The participants were video taped so that activity labels (the y or dependent variable) could be manually coded.

For the purposes of this project, the raw data is the processed data contained in the UCI HAR Dataset (the data that I have not run any software on.) We were provided the following files:

- activity_label.txt, which list the six activities. I used the informatin in this file to manually recode the labels from numberical labels to the more descriptive labels, as required by the project. 
- features_info.txt, which contains information about the processed data. 
- features.txt , which contains a list of the 561 columns of processed data. I used grepl to identify columns the mean and standard deviation data. I then used the logical vector to index the columns in the data set I wanted to keep. 
- subject_test.txt (dimension 2947 by 1 column), which contain the number of the volunteer. 
- X_test.txt (dimension 2947 observations by 561 columns), which contains the processed test data. This is the explanatory data. 
- y_test.txt (dimension 2947 by 1 columns), which contains the numerical (1-6) acitivity labels. This is the dependent variable 
- subject_train.txt (dimension 7352 by 1 column), which contain the number of the volunteer. 
- X_train.txt (dimension 7352 observations by 561 columns), which contains the processed test data. This is the explanatory data
- y_train.txt (dimension 7352 by 1 columns), which contains the numerical (1-6) acitivity labels. This is the dependent variable.

Codebook.Rmd contains all the steps I took to tranform the data into a tidy data set that contais the averages for each subject and activity.

run_analysis.R contains the R script

final_tidy_data.csv contains the final tidy data set
