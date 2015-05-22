# Getting_and_Cleaning_Data

The script (run_analysis.R) does the following:

  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive activity names.
  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
The following are the detailed steps:

  1) Set the working directory
  2) Import the test, train, features and activity labels datasets
  3) Check the dimensions of the imported files
  4) Combine the test and train files
  5) Collect the columns that contain the mean and standard deviation values
  6) Extract from the x dataset only the mean and standard deviation columns
  7) Assign the column names to the file
  8) Clean the column names
  9) Assign activity names to the activity files
  10) Changing the column name for the subject file
  11) Creating a combined file with the required columns
  12) Creating a dataset that contains the average of each variable
  13) Changing the column names of the first two columns (BY group in the aggregate function)
  14) Writing the above dataset as a text file
