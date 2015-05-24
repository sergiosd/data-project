This is the project to be presented in coursera couse "Getting and Cleaning Data"
The project consist in gathering and genering tiny data from a raw data set

The data set files along wiht the R script to process that data and generate the tidy data (processData.R) must be in the same directory
The user must load the R script and then execute the function generate_data() which returns a data frame with tiny data of the mean and std vectors explained in raw data description and the function generate_summ_data(data) which returns a summary of the data dataframe with the average of each subject and activity:

> source("%PATH%/processData.R")
> data<-generate_data()
> dat<-genereate_summ_data(data)


Raw Data Set description
------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Tiny data Variables
-------------------
- subject: number of subject, numeric between 1 and 30
- activity: activity label, charater="WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"
- features: mean and standard values betwen 0 and 1, description can be found in features.txt
