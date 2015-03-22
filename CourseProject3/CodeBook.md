
#DATA DICTIONARY - HUMAN ACTIVITY RECOGNITION

##SUBJECT AND ACTIVITY LABELS

 - Activity - (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
 - Subject - Numeric Label between 1 and 30 denoting each of the 30 experiment participants


##MEASUREMENTS (All values are the means by activity and subject for each of the measurements below)

variables with the prefix 'time' are time domain measures for each of Body Acceleration and 
Gravity Acceleration with Jerk and Magnitude calculations. X,Y,Z suffixes label the direction 
of the measurement

variables with the prefix 'FFT' are the FAST FOURIER TRANSFORMS for each of Body Acceleration and 
Gravity Acceleration with Jerk and Magnitude calculations. X,Y,Z suffixes label the direction 
of the measurement

For details on the collection and calculation of variables in the original dataset see
features_info.txt that is supplied with the experimental data:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


 - timeBodyAccelerationMeanX  
 - timeBodyAccelerationMeanY  
 - timeBodyAccelerationMeanZ  

 - timeGravityAccelerationMeanX 
 - timeGravityAccelerationMeanY 
 - timeGravityAccelerationMeanZ 

 - timeBodyAccelerationJerkMeanX 
 - timeBodyAccelerationJerkMeanY
 - timeBodyAccelerationJerkMeanZ

 - timeBodyGyroMeanX
 - timeBodyGyroMeanY
 - timeBodyGyroMeanZ

 - timeBodyGyroJerkMeanX
 - timeBodyGyroJerkMeanY
 - timeBodyGyroJerkMeanZ

 - timeBodyAccelerationMagnitudeMean
 - timeGravityAccelerationMagnitudeMean
 - timeBodyAccelerationJerkMagnitudeMean
 - timeBodyGyroMagnitudeMean
 - timeBodyGyroJerkMagnitudeMean

 - FFTBodyAccelerationMeanX
 - FFTBodyAccelerationMeanY
 - FFTBodyAccelerationMeanZ

 - FFTBodyAccelerationJerkMeanX
 - FFTBodyAccelerationJerkMeanY
 - FFTBodyAccelerationJerkMeanZ

 - FFTBodyGyroMeanX
 - FFTBodyGyroMeanY
 - FFTBodyGyroMeanZ

 - FFTBodyAccelerationMagnitudeMean
 - FFTBodyBodyAccelerationJerkMagnitudeMean
 - FFTBodyBodyGyroMagnitudeMean
 - FFTBodyBodyGyroJerkMagnitudeMean

 - timeBodyAccelerationStdDevX
 - timeBodyAccelerationStdDevY
 - timeBodyAccelerationStdDevZ

 - timeGravityAccelerationStdDevX
 - timeGravityAccelerationStdDevY
 - timeGravityAccelerationStdDevZ

 - timeBodyAccelerationJerkStdDevX
 - timeBodyAccelerationJerkStdDevY
 - timeBodyAccelerationJerkStdDevZ

 - timeBodyGyroStdDevX
 - timeBodyGyroStdDevY
 - timeBodyGyroStdDevZ

 - timeBodyGyroJerkStdDevX
 - timeBodyGyroJerkStdDevY
 - timeBodyGyroJerkStdDevZ

 - timeBodyAccelerationMagnitudeStdDev
 - timeGravityAccelerationMagnitudeStdDev
 - timeBodyAccelerationJerkMagnitudeStdDev
 - timeBodyGyroMagnitudeStdDev
 - timeBodyGyroJerkMagnitudeStdDev

 - FFTBodyAccelerationStdDevX
 - FFTBodyAccelerationStdDevY
 - FFTBodyAccelerationStdDevZ

 - FFTBodyAccelerationJerkStdDevX
 - FFTBodyAccelerationJerkStdDevY
 - FFTBodyAccelerationJerkStdDevZ

 - FFTBodyGyroStdDevX
 - FFTBodyGyroStdDevY
 - FFTBodyGyroStdDevZ

 - FFTBodyAccelerationMagnitudeStdDev
 - FFTBodyBodyAccelerationJerkMagnitudeStdDev
 - FFTBodyBodyGyroMagnitudeStdDev
 - FFTBodyBodyGyroJerkMagnitudeStdDev

