# Download and unzip the data with:
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip")

# just to make sure that we have the original data
dataPath <- file.path("UCI HAR Dataset")
unlink(dataPath, recursive = TRUE)
unzip("Dataset.zip")


### 1 ###

combinedPath <- file.path(dataPath, "combined")
testPath <- file.path(dataPath, "test")
trainPath <- file.path(dataPath, "train")

dir.create(combinedPath)
dir.create(file.path(combinedPath, file.path("Inertial Signals")))

# copy test files into combined folder
fileListTest <- list.files(testPath, recursive = TRUE)
filesFromTest <- file.path(testPath, fileListTest)
filesToCombined <- file.path(combinedPath, gsub("(_test|_train)", "", fileListTest))
file.copy(filesFromTest, filesToCombined)

# append train files to the files in combined folder
fileListTrain <- list.files(trainPath, recursive = TRUE)
filesFromTrain <- file.path(trainPath, fileListTrain)
file.append( filesToCombined, filesFromTrain )


