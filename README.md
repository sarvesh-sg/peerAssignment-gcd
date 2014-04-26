Peer Assignment-gcd
==================

Assignment for "getting and cleaning data course"

Scripts/Files
----------
run_analysis.R --> Main script to create tidy data from the "Dataset"
CodeBook.md -> a code book that describes 
		the variables, 
		the data, and 
		any transformations performed to clean up the data
tidyData_org.txt --> golden output file after running the run_analysis script. added here for comparison

Data
----------
Data is organised as shown below
	Dataset/
	|-- activity_labels.txt
	|-- features_info.txt
	|-- features.txt
	|-- README.txt   --> Contains description of all the files in the "Dataset" directory
	|-- test
	|   |-- subject_test.txt
	|   |-- X_test.txt
	|   `-- y_test.txt
	`-- train
	    |-- subject_train.txt
	    |-- X_train.txt
	    `-- y_train.txt

Assumptions/Interpretations
---------------
For the purpose of this assignment, following assumptions/Interpretation have been made
1. Interial Signals from the main data source have been ignored
2. mean extraction is done on columns containing "mean" in text as described in "features.txt"
3. tidy data is assumed to be arranged by activity and subject row wise, in no particular order

Output
----------
Executing run_analysis.R outputs a file "tidyData.txt" in project home directory

tidyData.txt -> output file containing 

"mean of all the mean and std deviation columns extracted from the dataset 
they are grouped by Activity and Subject"

for 6 activities and 30 subjects, you ll find 180 rows in the corresponding to 30*6 combinations


Execution
-----------
1. clone the respository on your system
2. open R Studio/Session
3. Install data.table package if not yet installed
4. run run_analysis.R in the project home (cloned repo) directory
5. View the output in the file called tidyData.txt

