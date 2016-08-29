README
================

Getting and Cleaning Data Class Project
---------------------------------------

### John Winchester

### 24 August 2016

Project Description
-------------------

This project is based on the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) *(See reference 1 below)*, which is comprised of measurements taken using a group of 30 test subjects, each of whom performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, and LAYING) while wearing a smartphone on his/her waist. The data set was partitioned into training and test data sets where 70% of the volunteers were used to generate the training data and 30% the test data. Please refer to the web site referenced above or the paper referenced below for further details on the source data set.

The goals of the current project are:

1.  to create a unified, tidy data set based on the source data set using a script named run\_analysis.R.
2.  to create a code book (CodeBook.md) that describes the variables, the data, and any transformations or other work peformed to create the tidy data set.
3.  to create a read me file (README.md, this document) that explains how the analysis script works.
4.  to provide a link to a GitHub repository that contains these artifacts.

Study design and data processing
--------------------------------

### Collection and structure of the raw data

A "zip" archive containing the data was downloaded from the UCI Machine Learning Respository using the link given above.  The data set was extracted from the zip archive and placed in the "data" subdirectory of the working directory for the project.


The data set includes the following files:
*The following information is either quoted or paraphrased from the README.txt file included in the original data set:*

* README.txt: a file giving an overview of the study.
* activity_labels.txt: a 6 row x 2 column table that associates each activity with a numerical class label as follows:
    * 1 WALKING
    * 2 WALKING_UPSTAIRS
    * 3 WALKING_DOWNSTAIRS
    * 4 SITTING
    * 5 STANDING
    * 6 LAYING
* features_info.txt: a file decribing the features selected for or derived in the study.
* features.txt: a 561 x 2 table that associates each of the 561 features with a column in the X_train and X_test tables.
* train: a directory containing the training data set.
    + X_train.txt: a 7352 x 561 table that gives the features derived from the sensor data. The columns are various time- and frequency-domain features *(variables)* derived from the accelerometer and gyroscope sensor signals from the smart phone and each row represents one test subject performing one activity.
    + y_train.txt: a 7352 x 1 table that associates the numerical activity class label with each "X" observation.
    + subject_train.txt: a 7352 x 1 table that associates each "X" observation with the appropriate test subject.
    + Inertial Signals: a directory containing the accelerometer and gyroscope sensor signals from the smart phone.
* test: a directory giving the test data set which consists of similar files to those the training set listed above but for the 2947 observations selected for the test set. The files are of the form: X_test.txt, etc.

Data analysis process
--------------------------

The instructions for this project are to:
1. Merge the training and test data sets to form a single data set.
2. Extract on the measurements on the mean and standard deviation for each measurement.
3. Use descriptive labels to name the activities in the data set.
4. Label the data set with the appropriate, descriptive variable names.
5. Use the data set from step 4 to create a second, independent tidy data set with the average of each variable for each activity and each subject.

####Description of the R script written to complete this project:

An R-script, run_analysis.R, was created that does the following:

1. Loads the X_train and X_test data into x_train (7352 x 561) and x_test (2947 x 561) data frames and then binds them by row into a single data frame named "x" with 7352 + 2947 = 10299 rows and 561 columns.
2.  Loads the features from the features.txt file and selects 66 the features (variables) that are paired measurements on the mean and standard deviation. 
    + Since the project instructions tell us to extract only the measurements on the mean and standard deviation for each measure, I interpreted this to mean that only measures with *paired* mean and standard deviations should be included, i.e., those features whose names included "-mean()" or "-std()". This criterion resulted in the exclusion of the 13 features whose names included "-meanFreq() as well as the 7 "angle" features obtained by averaging the signals in a window sample (please see the end of features_info.txt for more details).
3.  Descriptive variable names were then determined for each retained feature. The names given in the features.txt file were reasonably descriptive, so the variable names were created by
    + converting the name to lower case,
    + separating the name components with underscores, and
    + removing any other non-alphanumeric characters (e.g., "()").
4.  The "x" data frame was then winnowed to include only the 66 columns containing the paired mean and standard deviation measurements determined in step 2 above and its column names set using the descriptive variable names from step 3.
5.  The y_train.txt, y_test.txt, and activity_labels.txt files were then loaded into data frames y_train, y_test, and activity_labels respectively. The "y" data was bound by row into a single 10299 x 1 data frame and then used to look up the activity label for each observation. These labels were stored in a new data frame, "activity" (10299 x 1).
6.  The subject_train.txt and subject_test.txt files were then loaded and bound by row into a 10299 x 1 data frame, "subject" to give the subject for each observation.
7.  The "activity", "subject", and "x" data frames were then bound by column to create the full 10299 x 68 data frame.
8.  The full data frame was then grouped by activity and subject, summarised to give the mean value for each activity for each subject and the result saved into a 180 x 68 data frame named "tidy_data_set".
    + Note: grouping the full data set from step 7 by activity and subject resulted in an average of 57.21667 observations for each group. Thus, the final tidy data set determined by summarizing the same grouping on the mean has 10299 / 57.21667 = 180 rows.
9.  The original data was given to 8-decimal place precision, so the numerical values in the tidy_data_set data frame were rounded to 8-decimal place precision.
10.  The tidy data set was then written to a file "tidy_data_set.txt".

Additional notes
----------------

I used the readr package by Hadley Wickham to read from and write to files. It gives a simplified syntax and is very fast. To read the data back in using the readr package, I would suggest:

```tidy_data_set <- read_delim("tidy_data_set.txt", delim = " ")```

I would like to cite the valuable help provided by 
* David Hood's web posting: [Getting and Cleaning the Assignment](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)
* The [Data Science Specialization](http://datasciencespecialization.github.io/getclean/) website


References
----------

1.  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
