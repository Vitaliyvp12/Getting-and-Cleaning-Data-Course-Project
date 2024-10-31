# Load necessary libraries
library(dplyr)

# Step 1: Download and Unzip the Data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "UCI_HAR_Dataset.zip")
unzip("UCI_HAR_Dataset.zip")

# Step 2: Read the Data
# Read training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge the training and the test sets to create one data set
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Combine into one data frame
data <- cbind(subject_data, y_data, x_data)

# Step 3: Extract only the measurements on the mean and standard deviation for each measurement
# Read the features
features <- read.table("UCI HAR Dataset/features.txt")
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
data <- data[, c(1, 2, mean_std_features + 2)]  # +2 because of subject and activity columns

# Step 4: Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
data[, 2] <- activity_labels[data[, 2], 2]

# Step 5: Appropriately label the data set with descriptive variable names
names(data)[1] <- "subject"
names(data)[2] <- "activity"
names(data)[3:ncol(data)] <- features[mean_std_features, 2]

# Step 6: Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

# Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
