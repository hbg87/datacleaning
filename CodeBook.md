# Description of data and variables 

The dataset is derived from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The variables selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals. These `time` domain signals were captured at a constant rate of 50 Hz. They were then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the `acceleration` signal was then separated into `body` and `gravity` acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain `jerk` signals. The `magnitude` of these three-dimensional signals was also calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `frequency` domain signals. Additional vectors were also obtained by averaging the signals in a signal window sample and using them on the `angle` variable. The set of variables that were estimated from these signals and included in the tidy dataset are mean and standard deviation. 

# Variable Naming

**Identifiers**

* Subject - ID of Subject
* Activity - Type of activity 

**Variables For Each Feature Vector**

The names of the variables for each feature vector were set to lowercase to minimise coding mistakes resulting from the mistyping of variable names in the wrong case. 

The following prefixes were used to standardise the naming of the variables for each feature vector:

* Prefix ‘time’ to denote time
* Prefix ‘body’ to denote body
* Prefix ‘gyro’ to denote gyroscope
* Prefix ‘gravity’ to denote gravity
* Prefix ‘acc’ to denote acceleration
* Prefix ‘jerk’ to denote jerk
* Prefix ‘mag’ to denote magnitude
* Prefix ‘freq’ to denote frequency
* Prefix ‘meanfreq’ to denote  mean frequency
* Prefix ‘angle’ to denote angle
* Prefix ‘mean’ to denote mean
* Prefix ‘std’ to denote standard deviation
* Prefixes 'x’, ‘y’,  and ‘z' are used to denote 3-axial signals in the X, Y and Z directions

# Brief Description of data cleaning steps 

1. Merge the training and the test sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

For a detailed technical description of how each step is performed, please refer to [README.md]( https://github.com/hbg87/datacleaning/blob/master/README.md). 

# Complete list of variables included in the tidy data set:

* Subject
* Activity
* timebodyaccmeanx
* timebodyaccmeany
* timebodyaccmeanz
* timebodyaccstdx
* timebodyaccstdy
* timebodyaccstdz
* timegravityaccmeanx
* timegravityaccmeany
* timegravityaccmeanz
* timegravityaccstdx
* timegravityaccstdy
* timegravityaccstdz
* timebodyaccjerkmeanx
* timebodyaccjerkmeany
* timebodyaccjerkmeanz
* timebodyaccjerkstdx
* timebodyaccjerkstdy
* timebodyaccjerkstdz
* timebodygyromeanx
* timebodygyromeany
* timebodygyromeanz
* timebodygyrostdx
* timebodygyrostdy
* timebodygyrostdz
* timebodygyrojerkmeanx
* timebodygyrojerkmeany
* timebodygyrojerkmeanz
* timebodygyrojerkstdx
* timebodygyrojerkstdy
* timebodygyrojerkstdz
* timebodyaccmagmean
* timebodyaccmagstd
* timegravityaccmagmean
* timegravityaccmagstd
* timebodyaccjerkmagmean
* timebodyaccjerkmagstd
* timebodygyromagmean
* timebodygyromagstd
* timebodygyrojerkmagmean
* timebodygyrojerkmagstd
* freqbodyaccmeanx
* freqbodyaccmeany
* freqbodyaccmeanz
* freqbodyaccstdx
* freqbodyaccstdy
* freqbodyaccstdz
* freqbodyaccmeanfreqx
* freqbodyaccmeanfreqy
* freqbodyaccmeanfreqz
* freqbodyaccjerkmeanx
* freqbodyaccjerkmeany
* freqbodyaccjerkmeanz
* freqbodyaccjerkstdx
* freqbodyaccjerkstdy
* freqbodyaccjerkstdz
* freqbodyaccjerkmeanfreqx
* freqbodyaccjerkmeanfreqy
* freqbodyaccjerkmeanfreqz
* freqbodygyromeanx
* freqbodygyromeany
* freqbodygyromeanz
* freqbodygyrostdx
* freqbodygyrostdy
* freqbodygyrostdz
* freqbodygyromeanfreqx
* freqbodygyromeanfreqy
* freqbodygyromeanfreqz
* freqbodyaccmagmean
* freqbodyaccmagstd
* freqbodyaccmagmeanfreq
* freqbodyaccjerkmagmean
* freqbodyaccjerkmagstd
* freqbodyaccjerkmagmeanfreq
* freqbodygyromagmean
* freqbodygyromagstd
* freqbodygyromagmeanfreq
* freqbodygyrojerkmagmean
* freqbodygyrojerkmagstd
* freqbodygyrojerkmagmeanfreq
* angletimebodyaccmeangravity
* angletimebodyaccjerkmeangravitymean
* angletimebodygyromeangravitymean
* angletimebodygyrojerkmeangravitymean
* anglexgravitymean
* angleygravitymean
* anglezgravitymean
