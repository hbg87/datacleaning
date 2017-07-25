# Load required libraries
library(data.table)
library(dplyr)

## Download and unzip the dataset (if necessary)
if (!file.exists("UCI HAR Dataset")){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "UCI HAR Dataset.zip")
  unzip("UCI HAR Dataset.zip") 
}

## Load all required tables and assign column names
activityName <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityID", "Activity"))
featureName <- read.table("UCI HAR Dataset/features.txt", col.names = c("featureID", "Feature"))
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
testX <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = tolower(featureName$Feature))
testY <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
trainX <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = tolower(featureName$Feature))
trainY <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")

## Merge the training and the test sets to create one data set.
mergedSubject <-rbind(testSubject, trainSubject)
mergedActivity <- rbind(testY, trainY)
mergedTest <- rbind(testX, trainX)
mergedAll <- data.table(mergedSubject, mergedActivity, mergedTest)
  
## Format proper activity names (added here instead of daisy chaining into extract step so it runs through only 6 values instead of 10299)
# Removing all "_" from activity names
activityName$Activity <- gsub("_", " ", tolower(as.character(activityName$Activity)))

# Capitalizing each word (capwords function taken from tolower documentation)
capwords <- function(s, strict = FALSE) {
  cap <- function(s) paste(toupper(substring(s, 1, 1)),
                           {s <- substring(s, 2); if(strict) tolower(s) else s},
                           sep = "", collapse = " " )
  sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}
activityName$Activity <- capwords(activityName$Activity)

## Extracts only the measurements on the mean and standard deviation for each measurement.
tidy <- mergedAll %>% select(names(mergedAll)[grep("mean|std|Subject|Activity", names(mergedAll), ignore.case = TRUE)]) %>%
## Uses descriptive activity names to name the activities in the data set
    mutate(Activity = activityName[Activity, "Activity"]) %>%
## Appropriately labels the data set with descriptive variable names.
    setnames(gsub("^t", "time", names(.))) %>%
    setnames(gsub("^f", "freq", names(.))) %>%
    setnames(gsub("bodybody", "body", names(.))) %>%
    setnames(gsub("tbody", "timebody", names(.))) %>%
    setnames(gsub(pattern="[[:punct:]]", "", names(.)))

## Create a second, independent tidy data set with the average of each variable for 
## each activity and each subject.
tidy2 <- tidy %>% group_by(Subject, Activity) %>% 
  summarise_all(funs(mean)) 

## Output to txt file
write.table(tidy2, "tidy2.txt", row.names = FALSE)