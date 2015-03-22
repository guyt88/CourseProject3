
#Summary of Human Activity Smartphone Dataset

The purpose of this project is to summarize the data gathered in the Human Activity Recognition Using Smartphones Dataset Version 1.0 (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto).

The dataset can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

And a description of the experiment can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In order for the analysis to work, the below list of files will need to be in your R working
directory:
    
     - features.txt
     - activity_labels.txt
     - test/X_test.txt
     - test/Y_test.txt
     - test/subject_test.txt
     - train/X_train.txt
     - train/Y_train.txt
     - train/subject_train.txt

After downloading and extracting the required files to your R working directory, you can run the analysis by typing:

source("run_analysis.R") 
(Note: You may need to provide the full path to the directory where you saved these project files, if not to your R working directory.)

This script will combine training and test data sets from observations of 30 subjects performing six different activities using the accelerometer on a Samsung phone. (For more details see features_info.txt provided with the Human Activity Smartphone Dataset).

The analysis is performed in the followings steps:
  
   - Read in training data from X_train.txt, activities from Y_train.txt and subjects from subject_train.txt and combine into a single data set
   - Repeat step 1 for the test data set
   - Combine the two into a single data set
   - Select only the variables that store the mean and standard deviations observed in the experiment
   - Group By Activity and Subject and take the mean of each of the variables. The final dataset will be a tidy dataset called 'tidy_res' that will contain the means of each of the 'mean' and 'standard deviation' observations from the original dataset.
   - Write the 'tidy_res' data to a file called 'means_by_activity_and_subject.txt' in the R working directory.
  
For a description of each field in the 'tidy_res' dataset, see CodeBook.md provided with this project.

Files Included:
   - run_analysis.R
   - CodeBook.md
   - README.md

