# README

The run_analysis.R script included in this repo is used to create a second, independent tidy data set with the average of each variable for each activity and each subject from the raw data set. 

This run_analysis.R script performs the following steps:
* Load the libraries of data.table and dplyr that are required for this script to work
* Check if the raw dataset exists, the script would download and unzip the required files using download.file and unzip if the raw dataset is not found
* Load all the required tables from the dataset using read.table and assign appropriate column names (all ‘X’ tables were given lowercase column names to minimise coding mistakes resulting from the mistyping of variable names in the wrong case)
* The test and training sets for ‘Subject’, ‘X’ and ‘Y’ were merged respectively using rbind
* The merged data frames for ‘Subject’, ‘X’ and ‘Y’ were then merged to create one data set using data.table (A data table was used as it is more efficient for large data sets)
* The activity names were then formatted by removing all instances of “_” using gsub and capitalizing each word using the capwords function that was taken from the tolower documentation (This step was added here instead of daisy chaining into the subsequent dplyr extract step so it runs through only 6 values instead of 10299 values)
* Extract only the mean and standard deviation for each measure using dplyr, Select and grep (it was assumed that all instances of mean frequency and gravity mean should be included)
* Descriptive activity names were used to name the activities in the dataset using dplyr, %>% and mutate 
* The data set was then labelled with descriptive variable names using dplyr, %>%, setnames and gsub
* A second, independent tidy data set with the average of each variable for each activity and each subject was created using dply, %>%, group_by subject and activity, followed by summarise_all with funs(mean)
* The second, independent tidy data set was then outputted to a text file named “tidy2.txt” using write.table with row.names = FALSE
