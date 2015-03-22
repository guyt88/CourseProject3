
#suppress warning messages
options(warn=-1)

#load required libraries
message("Loading libraries...")
library(data.table)
library(plyr)
library(dplyr)

###### CREATE LIST OF HEADERS ######################################################
### Create the list of column headers for the training and test datasets from the 
### features text file
message("Creating header list...")
dt <- read.table("features.txt", header=FALSE, sep="", stringsAsFactors = FALSE)
header_list <- dt[,2]
first_two_headers <- c("Subject","Activity")
header_list <- append(first_two_headers,header_list)
####################################################################################

###### READ IN THE TRAINING DATA ###################################################
message("Reading in training data...")

dt <- read.table("./train/X_train.txt", header=FALSE, sep="")
train_data <- tbl_df(dt)

#read in the training activities
dt <- read.table("./train/Y_train.txt", header=FALSE, sep="")
train_activity <- tbl_df(dt)

#add activity column to the beginning of train_data
train_data <- tbl_df(cbind(train_activity,train_data))
 
#read in subjects
dt <- read.table("./train/subject_train.txt", header=FALSE, sep="")
train_subjects <- tbl_df(dt)

#add subjects column to the beginning of training data
train_data <- tbl_df(cbind(train_subjects,train_data))

#label the training data set
names(train_data) <- header_list
####################################################################################

###### READ IN THE TEST DATA #######################################################  
message("Reading in test data...")

dt <- read.table("./test/X_test.txt", header=FALSE, sep="")
test_data <- tbl_df(dt)

#read in the test activities
dt <- read.table("./test/Y_test.txt", header=FALSE, sep="")
test_activity <- tbl_df(dt)

#add activity column to the beginning of test_data
test_data <- tbl_df(cbind(test_activity,test_data))

#read in subjects
dt <- read.table("./test/subject_test.txt", header=FALSE, sep="")
test_subjects <- tbl_df(dt)

#add subjects column to the beginning of test data
test_data <- tbl_df(cbind(test_subjects,test_data))

#label the columns
names(test_data) <- header_list
####################################################################################

###### APPEND THE TEST DATA TO THE TRAINING DATA ###################################
message("Appending training and test data...")

all_data <- rbind(train_data,test_data)

#remove unnecessary objects from the environment
rm("train_data")
rm("test_data")
rm("test_subjects")
rm("train_subjects")
rm("test_activity")
rm("train_activity")
rm("dt")

####################################################################################

###### TAKE JUST THE COLUMNS WE NEED ###############################################
message("Selecting required columns...")

#limit columns
std_cols <- grep("std\\(\\)",header_list)
mean_cols <- grep("mean\\(\\)",header_list)

#fix the column headers
R_names <- make.names(names=names(all_data), unique=TRUE, allow_ = TRUE)
names(all_data) <- R_names

#select on required columns
all_data_mean_std <- select(all_data,1,2,mean_cols,std_cols)

#remove unnecessary objects form the environment
rm("all_data")
#####################################################################################

###### LOAD IN THE ACTIVITY CODES ###################################################
message("Replacing Activity Codes with descriptive text...")

#The descriptive names will replace the numeric codes making the Activity 
#column more readable
dt <- read.table("activity_labels.txt", header=FALSE, sep="")
activity_labels <- tbl_df(dt)
names(activity_labels) <- c("Activity","ActivityDesc")

#Merge the two to add a new column - "ActivityDesc"
#The Activity column will then be dropped and the ActivityDesc column renamed
all_data_mean_std <- merge(activity_labels,all_data_mean_std,"Activity")
all_data_mean_std <- select(all_data_mean_std,-Activity)

colnames(all_data_mean_std)[1] <- "Activity"

#remove unnecessary objects from the environment
rm("activity_labels")
rm("dt")

###### CLEAN UP OTHER COLUMN NAMES ##################################################
message("Cleaning up column names...")

#get column list
header_list <- names(all_data_mean_std)
#remove all "."
header_list <- gsub("\\.","",header_list)
#replace "t" with "time" to be more explicit
header_list <- sub("^t","time",header_list)
#replace "f" with "FFT" (Fast Fourier Transform) to be more explicit
header_list <- sub("^f","FFT",header_list)
#replace "Acc" with "Acceleration" to be more descriptive
header_list <- gsub("Acc","Acceleration",header_list)
#replace "std" with "StdDev" to be more descriptive
header_list <- gsub("Mag","Magnitude",header_list)
#replace "std" with "StdDev" to be more descriptive
header_list <- gsub("std","StdDev",header_list)
#replace "mean" with "Mean" to differentaite from the other words in the field name
header_list <- gsub("mean","Mean",header_list)
#apply the new header names to the dataset
names(all_data_mean_std) <- header_list

rm("header_list")
#####################################################################################



###### CREATE FINAL TIDY DATASET ####################################################

#The final dataset will only contain the means of the standard deviations and the 
#means of all the variables grouped by Activity and Subject

message("Creating tidy dataset...")

#Group BY Activity and Subject
by_activity_subject <- group_by(all_data_mean_std,Activity,Subject)

#summarise
tidy_res <- summarise_each(by_activity_subject,funs(mean),3:68)

#remove dataset - no longer necessary
rm("all_data_mean_std")
rm("by_activity_subject")
#####################################################################################


###### WRITE TIDY DATASET TO A FILE #################################################

#Uncomment the below line to write the final result to a file in the R working 
#directory called means_by_activity_and_subject.txt

message("Writing tidy data to file means_by_activity_and_subject.txt...")
write.table(tidy_res,file="means_by_activity_and_subject.txt",row.names=FALSE)

#####################################################################################


message("Complete. The final result 'tidy_res' should now be loaded in the environment.")










