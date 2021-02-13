## Getting_and_cleaning_data_final_project

This repository contains the final project for the Coursera Getting and Clean Data course.

The purpose of this project was to demostrate the ability to create a tidy data set. The data for the project is the Human Activity Recognition Using Smartphones Dataset, verson 1. The data came from a group of 30 volunteers, aged 19-48, who performed six different activities while wearing a Samsung Galaxy S II on their waist. This yielded acceleromenter and angular velocity sensor signals. The raw data was then passed through a noise filter and a Butterworth low-pass filter was used to separate the signals into acceleration and gravity components. The participants were video taped so that activity labels (the y or dependent variable) could be manually coded.

For the purposes of this project, the raw data is the processed data contained in the UCI HAR Dataset (the data that I have not run any software on.) We were provided the following files:

- activity_label.txt, which list the six activities. I used the information in this file to manually recode the labels from numerical labels to more descriptive labels, as required by the project. 
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

The final tidy data set contains 180 observations of 68 variables.  

- each observation forms a row  
- each variable forms a column  

- The first column, subject, is an id variable ranging from 1-30 that identifies 
the volunteer
- The second column, activity, is a descriptive id variable that lists the 
activity of the volunteer. 
- Columns 3:68 contain the average value of the processed data for each subject
and activity

- "tacceleration_-mean()-X"  
-  "tacceleration_-mean()-Y"                
-  "tacceleration_-mean()-Z" 
-  "tacceleration_-std()-X"  
-  "tacceleration_-std()-Y"   
-  "tacceleration_-std()-Z"                   
-  "tgravity_acceleration_-mean()-X"  
-  "tgravity_acceleration_-mean()-Y"          
-  "tgravity_acceleration_-mean()-Z"  
-  "tgravity_acceleration_-std()-X"   
-  "tgravity_acceleration_-std()-Y"   
-  "tgravity_acceleration_-std()-Z"
-  "tacceleration_jerk_-mean()-X" 
-  "tacceleration_jerk_-mean()-Y"  
-  "tacceleration_jerk_-mean()-Z"  
-  "tacceleration_jerk_-std()-X"  
-  "tacceleration_jerk_-std()-Y" 
-  "tacceleration_jerk_-std()-Z"  
-  "tgyroscope_-mean()-X"    
-  "tgyroscope_-mean()-Y"                     
-  "tgyroscope_-mean()-Z"   
-  "tgyroscope_-std()-X"                      
-  "tgyroscope_-std()-Y"   
-  "tgyroscope_-std()-Z"                      
-  "tgyroscope_jerk_-mean()-X" 
-  "tgyroscope_jerk_-mean()-Y"              
-  "tgyroscope_jerk_-mean()-Z"  
-  "tgyroscope_jerk_-std()-X"               
-  "tgyroscope_jerk_-std()-Y" 
-  "tgyroscope_jerk_-std()-Z"               
-  "tacceleration_magnitude_-mean()"   
-  "tacceleration_magnitude_-std()"         
-  "tgravity_acceleration_magnitude_-mean()" 
-  "tgravity_acceleration_magnitude_-std()" 
-  "tacceleration_jerk_magnitude_-mean()"  
-  "tacceleration_jerk_magnitude_-std()"    
-  "tgyroscope_magnitude_-mean()"  
-  "tgyroscope_magnitude_-std()"            
-  "tgyroscope_jerk_magnitude_-mean()" 
-  "tgyroscope_jerk_magnitude_-std()"       
-  "facceleration_-mean()-X"   
-  "facceleration_-mean()-Y"                
-  "facceleration_-mean()-Z"   
-  "facceleration_-std()-X"                 
-  "facceleration_-std()-Y" 
-  "facceleration_-std()-Z"                 
-  "facceleration_jerk_-mean()-X"  
-  "facceleration_jerk_-mean()-Y"           
-  "facceleration_jerk_-mean()-Z" 
-  "facceleration_jerk_-std()-X"            
-  "facceleration_jerk_-std()-Y" 
-  "facceleration_jerk_-std()-Z"            
-  "fgyroscope_-mean()-X" 
-  "fgyroscope_-mean()-Y"                   
-  "fgyroscope_-mean()-Z"    
-  "fgyroscope_-std()-X"                    
-  "fgyroscope_-std()-Y"  
-  "fgyroscope_-std()-Z"                    
-  "facceleration_magnitude_-mean()"  
-  "facceleration_magnitude_-std()"         
-  "facceleration_jerk_magnitude_-mean()"  
-  "facceleration_jerk_magnitude_-std()"    
-  "fgyroscope_magnitude_-mean()"   
-  "fgyroscope_magnitude_-std()"  

### References:

https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html
