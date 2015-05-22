
#Set the working directory
setwd("~/Coursera/Data_Science_Specialization/Getting_and_Cleaning_Data/Working_Directory")
getwd()

#Import the test, train, features and activity labels datasets
x_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",header = FALSE)
y_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",header = FALSE)
sub_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",header = FALSE)

x_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",header = FALSE)
sub_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",header = FALSE)

features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt",header = FALSE)

activity_labels <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",header = FALSE)

#Check the dimensions of the imported files
head(x_train)
head(y_train)
head(sub_train)

dim(x_train)
dim(y_train)
dim(sub_train)

head(features)
dim(features)

head(activity_labels)
dim(activity_labels)

#Combine the test and train files
x_train_test <- rbind(x_train,x_test)
y_train_test <- rbind(y_train,y_test)
sub_train_test <- rbind(sub_train,sub_test)

#Collect the columns that contain the mean and standard deviation values
mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

#Extract from the x dataset only the mean and standard deviation columns
x_mean_std <- x_train_test[,mean_std_features]

#Assign the column names to the file
names(x_mean_std) <- features[mean_std_features,2]

#Clean the column names
names(x_mean_std) <- gsub("\\(|\\)","",names(x_mean_std))

#Assign activity names to the activity files
y_train_test[,1] <- activity_labels[y_train_test[,1],2]
names(y_train_test) <- "Activity"

#Changing the column name for the subject file
names(sub_train_test) <- "Subject"


#Creating a combined file with the required columns
combined_file <- cbind(sub_train_test, y_train_test, x_mean_std)

?aggregate

#Creating a dataset that contains the average of each variable
avg_file <- aggregate(  x = combined_file[,3:dim(combined_file)[2]],
                        by = list(combined_file$Subject, combined_file$Activity), 
                        FUN = "mean"
                     )

#Changing the column names of the first two columns (BY group in the aggregate function)
colnames(avg_file)[1] <- "Subject"
colnames(avg_file)[2] <- "Activity"


#Writing the above dataset as a text file
write.table(avg_file, file = "Final_Avg_UCI_HAR_File.txt", row.names = FALSE)
