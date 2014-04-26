Code Book
============

Variables
------------
trainData,testData --> stores train/test data set

activityTrainData,activityTestData --> stores activity data set for train/test data

subjectTrain,subjectTest --> stores subject details who performed the activity for train/test data

activityLabels --> contains the name for activity field in the dataset

features --> contains list of names corresponding to train/test dataset

mergedTrainData,mergedTestData -> contains concatenation of activity , subject, data values for train/test data

dataSet --> contains final merged data set 

extractedDataset --> contains extracted data set containing only mean and std deviation features along with activity and subject column

tidyData --> contains final tidy data containing mean of all features in extracted dataset grouped by subject and activity
 

Data
-------
The data for the project has been downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For details about the data , refer README.txt in the Dataset directory

Inertial Signals from the main data source have been ingnored for the purpose of this assigment
and hence are also not part of the repository


Transformations
----------------
The flow of the run_analysis.R scripty is as follows
1. read activity_labels.txt and features.txt using read.table

2. read the all [data,subject,activity] using read.table

3. replace the activity data with respective labels from activity_labels.txt
	* done here assuming time taken would be small compared to working on the merged data set

4. concatenate all of them to create train data set

5. repeat step 2-4 for test data

6. merge data from step 4 and 5 to from the dataset needed for the project

7. Give appropriate column names to the data set using names in features.txt

8. Extract data set for only mean and std deviation from the feature list

9. Convert data.frame to data.table for faster operation

10. calculate mean of all the columns group by activity and subject using .SD and lapply function on the data.table

11. write out the result into tidyData.txt file
