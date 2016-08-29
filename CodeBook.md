Code Book for tidy_data_set.txt
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
2.  to create a code book (CodeBook.md, this document) that describes the variables, the data, and any transformations or other work peformed to create the tidy data set.
3.  to create a read me file (README.md) that explains how the analysis script works.
4.  to provide a link to a GitHub repository that contains these artifacts.



Steps taken to create tidy_data_set.txt
--------------------------

A high-level description of the process used to complete this project follows below. Please see the README.txt file for this project for more detail.

1. The data set described above was extracted from the zip archive and placed a the "data" subdirectory of the working directory for the project.
2. An R-script, run_analysis.R, was created that does the following:
    + Loads the X_train and X_test data and binds them by row into a single data frame.
    + Loads the features from the features.txt file and selects the 66 features (variables) that are paired measurements on the mean and standard deviation. *More detail on this step and the selection criteria is available in the README.txt file for this project.*
    + Descriptive variable names were then determined for each retained feature. The names given in the features.txt file were reasonably descriptive, so the variable names were created by (1) converting the name to lower case, (2) separating the name components with underscores, and (3) removing any other non-alphanumeric characters (e.g., "()").
    + The "x" data frame was then winnowed to include only the 66 columns containing the paired mean and standard deviation measurements and its column names set using the descriptive variable names.
    + The y_train, y_test, and activity_labels files were then loaded. The "y" data was bound by row into a single data frame and used to look up the activity label for each observation. These labels were stored in a new data frame, "activity".
    + The subject_train and subject_test files were then loaded and bound by row into a data frame, "subject" to give the subject for each observation.
    + The "activity", "subject", and "x" data frames were then bound by column to create the full data frame.
    + The full data frame was then grouped by activity and subject, summarised to give the mean value for each activity for each subject.
    + The original data was given to 8-decimal place precision, so the numerical values in the tidy_data_set data frame were rounded to 8-decimal place precision.
    + The tidy data set was then written to a file "tidy_data_set.txt".

Description of the variables in the tidy_data_set.txt file
-------------------------------------------------------

The file contains a 180 x 68 table that gives the average of the paired measurements of the mean and standard devitiation as described above. The data set is comprised of values in the time (prefixed by "t") and frequency (prefixed by "f") domains. While the original data set did not specify the units explicitly, it should be safe to assume that units of time are seconds and frequency Hz.

The variable listing that follows gives the variable for each column of the tidy data set, its R class, and representative values for each variable. The listing employs the following abbreviations:
* acc = acceleration
* gyro = gyroscopic

### Variables

##### activity
   Class: character  
   Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS
           SITTING, STANDING, LAYING

##### subject
   Class: integer  
   Values: Min: 1, Max: 30

##### t_body_acc_mean_x
   Class: numeric  
   Values: Min: 0.22159824 Max: 0.22159824 Mean: 0.30146102 SDev: 0.27482468 
 
##### t_body_acc_mean_y
   Class: numeric  
   Values: Min: -0.04051395 Max: -0.04051395 Mean: -0.00130829 SDev: -0.01787552 
 
##### t_body_acc_mean_z
  Class: numeric  
  Values: Min: -0.1525139 Max: -0.1525139 Mean: -0.07537847 SDev: -0.10916382 

##### t_body_acc_std_x
  Class: numeric  
  Values: Min: -0.99606864 Max: -0.99606864 Mean: 0.62691707 SDev: -0.55769008 

##### t_body_acc_std_y
  Class: numeric  
  Values: Min: -0.99024095 Max: -0.99024095 Mean: 0.61693702 SDev: -0.46046264 

##### t_body_acc_std_z
  Class: numeric  
  Values: Min: -0.98765866 Max: -0.98765866 Mean: 0.60901788 SDev: -0.57556025 

##### t_gravity_acc_mean_x
  Class: numeric  
  Values: Min: -0.68004316 Max: -0.68004316 Mean: 0.97450873 SDev: 0.69747751 

##### t_gravity_acc_mean_y
  Class: numeric  
  Values Min: -0.47989484 Max: -0.47989484 Mean: 0.95659381 SDev: -0.01621284 

##### t_gravity_acc_mean_z
  Class: numeric  
  Values: Min: -0.49508872 Max: -0.49508872 Mean: 0.95787304 SDev: 0.11183588 

##### t_gravity_acc_std_x
  Class: numeric  
  Values: Min: -0.99676423 Max: -0.99676423 Mean: -0.82955495 SDev: -0.96375253 

##### t_gravity_acc_std_y
  Class: numeric  
  Values: Min: -0.99424765 Max: -0.99424765 Mean: -0.64357836 SDev: -0.95242956 

##### t_gravity_acc_std_z
  Class: numeric  
  Values: Min: -0.99095725 Max: -0.99095725 Mean: -0.61016117 SDev: -0.93640104 

##### t_body_acc_jerk_mean_x
  Class: numeric  
  Values: Min: 0.0426881 Max: 0.0426881 Mean: 0.13019304 SDev: 0.07947356 

##### t_body_acc_jerk_mean_y
  Class: numeric  
  Values: Min: -0.03868721 Max: -0.03868721 Mean: 0.05681859 SDev: 0.00756521 

##### t_body_acc_jerk_mean_z
  Class: numeric  
  Values: Min: -0.06745839 Max: -0.06745839 Mean: 0.03805336 SDev: -0.0049534 

##### t_body_acc_jerk_std_x
  Class: numeric  
  Values: Min: -0.99460454 Max: -0.99460454 Mean: 0.54427304 SDev: -0.5949467 

##### t_body_acc_jerk_std_y
  Class: numeric  
  Values: Min: -0.98951357 Max: -0.98951357 Mean: 0.35530672 SDev: -0.56541471 

##### t_body_acc_jerk_std_z
  Class: numeric  
  Values: Min: -0.99328831 Max: -0.99328831 Mean: 0.03101571 SDev: -0.73595769 

##### t_body_gyro_mean_x
  Class: numeric  
  Values: Min: -0.20577543 Max: -0.20577543 Mean: 0.19270448 SDev: -0.03243716 

##### t_body_gyro_mean_y
  Class: numeric  
  Values: Min: -0.20420536 Max: -0.20420536 Mean: 0.02747076 SDev: -0.07425957 

##### t_body_gyro_mean_z
  Class: numeric  
  Values: Min: -0.0724546 Max: -0.0724546 Mean: 0.17910206 SDev: 0.08744465 

##### t_body_gyro_std_x
  Class: numeric  
  Values: Min: -0.99427659 Max: -0.99427659 Mean: 0.26765722 SDev: -0.6916399 

##### t_body_gyro_std_y
  Class: numeric  
  Values: Min: -0.99421047 Max: -0.99421047 Mean: 0.47651871 SDev: -0.65330203 

##### t_body_gyro_std_z
  Class: numeric  
  Values: Min: -0.98553836 Max: -0.98553836 Mean: 0.56487582 SDev: -0.61643529 

##### t_body_gyro_jerk_mean_x
  Class: numeric  
  Values: Min: -0.15721254 Max: -0.15721254 Mean: -0.02209163 SDev: -0.0960568 

##### t_body_gyro_jerk_mean_y
  Class: numeric  
  Values: Min: -0.07680899 Max: -0.07680899 Mean: -0.01320228 SDev: -0.04269278 

##### t_body_gyro_jerk_mean_z
  Class: numeric  
  Values: Min: -0.09249985 Max: -0.09249985 Mean: -0.00694066 SDev: -0.05480188 

##### t_body_gyro_jerk_std_x
  Class: numeric  
  Values: Min: -0.99654254 Max: -0.99654254 Mean: 0.17914865 SDev: -0.70363271 

##### t_body_gyro_jerk_std_y
  Class: numeric  
  Values: Min: -0.99708158 Max: -0.99708158 Mean: 0.29594593 SDev: -0.76355184 

##### t_body_gyro_jerk_std_z
  Class: numeric  
  Values: Min: -0.99538079 Max: -0.99538079 Mean: 0.1932065 SDev: -0.70955918 

##### t_body_acc_mag_mean
  Class: numeric  
  Values: Min: -0.9864932 Max: -0.9864932 Mean: 0.64460433 SDev: -0.49728967 

##### t_body_acc_mag_std
  Class: numeric  
  Values: Min: -0.98646454 Max: -0.98646454 Mean: 0.42840592 SDev: -0.54390867 

##### t_gravity_acc_mag_mean
  Class: numeric  
  Values: Min: -0.9864932 Max: -0.9864932 Mean: 0.64460433 SDev: -0.49728967 

##### t_gravity_acc_mag_std
  Class: numeric  
  Values: Min: -0.98646454 Max: -0.98646454 Mean: 0.42840592 SDev: -0.54390867 

##### t_body_acc_jerk_mag_mean
  Class: numeric  
  Values: Min: -0.99281472 Max: -0.99281472 Mean: 0.4344904 SDev: -0.60792959 

##### t_body_acc_jerk_mag_std
  Class: numeric  
  Values: Min: -0.99464692 Max: -0.99464692 Mean: 0.45061207 SDev: -0.58417561 

##### t_body_gyro_mag_mean
  Class: numeric  
  Values: Min: -0.98074085 Max: -0.98074085 Mean: 0.41800461 SDev: -0.56516308 

##### t_body_gyro_mag_std
  Class: numeric  
  Values: Min: -0.98137268 Max: -0.98137268 Mean: 0.29997598 SDev: -0.63039472 

##### t_body_gyro_jerk_mag_mean
  Class: numeric  
  Values: Min: -0.99732253 Max: -0.99732253 Mean: 0.08758166 SDev: -0.7363693 

##### t_body_gyro_jerk_mag_std
  Class: numeric  
  Values: Min: -0.99766607 Max: -0.99766607 Mean: 0.2501732 SDev: -0.75501519 

##### f_body_acc_mean_x
  Class: numeric  
  Values: Min: -0.99524993 Max: -0.99524993 Mean: 0.53701202 SDev: -0.57579998 

##### f_body_acc_mean_y
  Class: numeric  
  Values: Min: -0.9890343 Max: -0.9890343 Mean: 0.52418769 SDev: -0.48873271 

##### f_body_acc_mean_z
  Class: numeric  
  Values: Min: -0.98947393 Max: -0.98947393 Mean: 0.28073595 SDev: -0.62973875 

##### f_body_acc_std_x
  Class: numeric  
  Values: Min: -0.99660457 Max: -0.99660457 Mean: 0.65850654 SDev: -0.55220111 

##### f_body_acc_std_y
  Class: numeric  
  Values: Min: -0.9906804 Max: -0.9906804 Mean: 0.56019134 SDev: -0.48147873 

##### f_body_acc_std_z
  Class: numeric  
  Values: Min: -0.9872248 Max: -0.9872248 Mean: 0.68712416 SDev: -0.58236141 

##### f_body_acc_jerk_mean_x
  Class: numeric  
  Values: Min: -0.9946308 Max: -0.9946308 Mean: 0.47431726 SDev: -0.61392822 

##### f_body_acc_jerk_mean_y
  Class: numeric  
  Values: Min: -0.98939882 Max: -0.98939882 Mean: 0.27671685 SDev: -0.58816307 

##### f_body_acc_jerk_mean_z
  Class: numeric  
  Values: Min: -0.99201845 Max: -0.99201845 Mean: 0.15777569 SDev: -0.71435849 

##### f_body_acc_jerk_std_x
  Class: numeric  
  Values: Min: -0.99507376 Max: -0.99507376 Mean: 0.47680389 SDev: -0.61210328 

##### f_body_acc_jerk_std_y
  Class: numeric  
  Values: Min: -0.99046808 Max: -0.99046808 Mean: 0.34977129 SDev: -0.57073097 

##### f_body_acc_jerk_std_z
  Class: numeric  
  Values: Min: -0.99310776 Max: -0.99310776 Mean: -0.00623648 SDev: -0.75648943 

##### f_body_gyro_mean_x
  Class: numeric  
  Values: Min: -0.99312261 Max: -0.99312261 Mean: 0.47496245 SDev: -0.6367396 

##### f_body_gyro_mean_y
  Class: numeric  
  Values: Min: -0.99402549 Max: -0.99402549 Mean: 0.32881701 SDev: -0.6766868 

##### f_body_gyro_mean_z
  Class: numeric  
  Values: Min: -0.98595779 Max: -0.98595779 Mean: 0.49241438 SDev: -0.60439124 

##### f_body_gyro_std_x
  Class: numeric  
  Values: Min: -0.99465219 Max: -0.99465219 Mean: 0.19661329 SDev: -0.71103566 

##### f_body_gyro_std_y
  Class: numeric  
  Values: Min: -0.99435309 Max: -0.99435309 Mean: 0.64623364 SDev: -0.64543342 

##### f_body_gyro_std_z
  Class: numeric  
  Values: Min: -0.98672527 Max: -0.98672527 Mean: 0.52245422 SDev: -0.65774659 

##### f_body_acc_mag_mean
  Class: numeric  
  Values: Min: -0.98680065 Max: -0.98680065 Mean: 0.58663755 SDev: -0.53651669 

##### f_body_acc_mag_std
  Class: numeric  
  Values: Min: -0.98764848 Max: -0.98764848 Mean: 0.17868458 SDev: -0.62096329 

##### f_body_body_acc_jerk_mag_mean
  Class: numeric  
  Values: Min: -0.99399828 Max: -0.99399828 Mean: 0.53840485 SDev: -0.57561749 

##### f_body_body_acc_jerk_mag_std
  Class: numeric  
  Values: Min: -0.99436667 Max: -0.99436667 Mean: 0.31634642 SDev: -0.59916087 

##### f_body_body_gyro_mag_mean
  Class: numeric  
  Values: Min: -0.98653524 Max: -0.98653524 Mean: 0.20397976 SDev: -0.6670991 

##### f_body_body_gyro_mag_std
  Class: numeric  
  Values: Min: -0.98146884 Max: -0.98146884 Mean: 0.23665966 SDev: -0.67232235 

##### f_body_body_gyro_jerk_mag_mean
  Class: numeric  
  Values: Min: -0.99761739 Max: -0.99761739 Mean: 0.14661857 SDev: -0.75638527 

##### f_body_body_gyro_jerk_mag_std
  Class: numeric  
  Values: Min: -0.99758523 Max: -0.99758523 Mean: 0.28783462 SDev: -0.77151705

References
----------

1.  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
