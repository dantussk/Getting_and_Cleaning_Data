# Getting_and_Cleaning_Data

The script (run_analysis.R) does the following:

  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive activity names.
  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The following are the detailed steps:

  Set the working directory
  Import the test, train, features and activity labels datasets
  Check the dimensions of the imported files
  Combine the test and train files
  Collect the columns that contain the mean and standard deviation values
  Extract from the x dataset only the mean and standard deviation columns
  Assign the column names to the file
  Clean the column names
  Assign activity names to the activity files
  Changing the column name for the subject file
  Creating a combined file with the required columns
  Creating a dataset that contains the average of each variable
  Changing the column names of the first two columns (BY group in the aggregate function)
  Writing the above dataset as a text file
