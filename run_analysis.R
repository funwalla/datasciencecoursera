library(readr)
library(dplyr)
library(stringr)

# function to read and check data files:
read_check <- function(file){
  x <- read_fwf(file,
                col_positions = fwf_empty(file))
  print(dim(x))
  print(x[c(1,nrow(x)), c(1,ncol(x))])
  return(x)
}

#
# 1. Prepare the observational data
#
#    a. Load and merge the observational data (x_test and x_train)
x_test  <- read_check("data/test/X_test.txt")
x_train <- read_check("data/train/X_train.txt")
x <- rbind(x_test, x_train)
#    b. Load the feature data
features <- read_delim(file = "data/features.txt",
                       delim = " ",
                       col_names = FALSE)
#    c. Determine which columns measure the mean and standard
#       deviation for each measurement
feature_col_index <- grep("(mean|std)\\(", features$X2)
#    d. Convert the feature names to hypen-delimited, lower case form
feature_names <- features$X2[feature_col_index] %>%
  tolower %>%
  str_replace_all(c("^t"      = "t_",
                    "^f"      = "f_",
                    "body"    = "body_",
                    "gravity" = "gravity_",
                    "acc"     = "acc_", 
                    "gyro"    = "gyro_",
                    "jerk"    = "jerk_",
                    "\\(\\)"  = "",
                    "-"       = "_",
                    "__"      = "_"))
#    e. Visually check feature names against original data:
# View(data_frame(ind = feature_col_index,
#                 old_feature_names = features$X2[feature_col_index],
#                 new_feature_names = feature_names))
#    f. Winnow the observations to include only the mean and standard
#       deviational measurements and relabel with the new feature
#       names
x <- select(x, feature_col_index)
colnames(x) <- feature_names

#
# 2. Prepare the column that gives the activity measured for each
#    x observation above:
y_test  <- read_check("data/test/y_test.txt")
y_train <- read_check("data/train/y_train.txt")

activity_labels <- read_delim(file = "data/activity_labels.txt",
                              delim = " ",
                              col_names = FALSE)
activity <- rbind(y_test, y_train) %>%
  left_join(activity_labels) %>%
  transmute(activity = X2)

#
# 3. Prepare th column that gives the subject for each x observation
#    above
subject_test <- read_delim("data/test/subject_test.txt",
                           delim = "\n",
                           col_names = FALSE)
subject_train <- read_delim("data/train/subject_train.txt",
                            delim = "\n",
                            col_names = FALSE)
subject <- rbind(subject_test, subject_train) %>%
  transmute(subject = X1)

# 4. Bind the observations (x data), activities, and subjects into a 
#    single data frame
full_set <- cbind(activity, subject, x)

# 5. Create the tidy data set with the average of each variable for
#    each activity and each subject, maintaining the same 8-digit
#    precision as in the original data.
tidy_data_set <- full_set %>%
  group_by(activity, subject) %>%
  summarise_all(mean)

tidy_data_set[ , -(1:2)] <- round(tidy_data_set[ , -(1:2)], 
                                  digits = 8)

# 6. Write the tidy data set to a text file
write_delim(tidy_data_set, "tidy_data_set.txt")
# function to read the data file back in:
#tidy_data_set <- read_delim("tidy_data_set.txt", delim = " ")


