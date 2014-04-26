#Read activity and features labels applicable to train/test data
activityLabels <- read.table("Dataset/activity_labels.txt",stringsAsFactors=FALSE)
features <- read.table("Dataset/features.txt",stringsAsFactors=FALSE)

#Read and concatenating Train data
trainData <- read.table("Dataset/train/X_train.txt")
activityTrainData <- read.table("Dataset/train/y_train.txt")
subjectTrain <- read.table("Dataset/train/subject_train.txt")

# replace training Id with activity labels in train data
for (id in activityLabels[,1]) {
  activityTrainData[activityTrainData[,1]==id,1] <- activityLabels[activityLabels$V1==id,2]
}

mergedTrainData <- cbind(activityTrainData,subjectTrain,trainData)
# End of merging train data

#Read and concatenating Test data
testData <- read.table("Dataset/test/X_test.txt")
activityTestData <- read.table("Dataset/test/y_test.txt")
subjectTest <- read.table("Dataset/test/subject_test.txt")

# replace training Id with activity labels in test data
for (id in activityLabels[,1]) {
  activityTestData[activityTestData[,1]==id,1] <- activityLabels[activityLabels$V1==id,2]
}
mergedTestData <- cbind(activityTestData,subjectTest,testData)
# End of merging test data

#final merged data set
dataSet <- rbind(mergedTrainData,mergedTestData)

#replacing with proper column names on the final dataset
colnames(dataSet) <- c("Activity","Subject",features[,2])

#Extracting only mean and std deviation values from the final data set
extractedDataset <- dataSet[1:2]

extractedDataset <- cbind(extractedDataset,
                          dataSet[,grep(".*mean.*",names(dataSet))],
                          dataSet[,grep(".*std.*",names(dataSet))]
                          )

#convert it to data.table for faster processing
require(data.table)
extractedDataset <- data.table(extractedDataset)

#generate tidy data by activity and subject group
tidyData<-extractedDataset[, lapply(.SD, mean), by=c("Activity", "Subject")]

#write out the data to the file tidyData.txt
write.table(tidyData, file = "tidyData.txt",row.names = FALSE)
