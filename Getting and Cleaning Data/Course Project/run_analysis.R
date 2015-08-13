# Download and unzip the data with:
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip")

# just to make sure that we have the original data, remove the "UCI HAR Dataset" 
# folder and unzip the "Dataset.zip" file. 
dataPath <- file.path("UCI HAR Dataset")
unlink(dataPath, recursive = TRUE)
unzip("Dataset.zip")

### 1 ###
# Merges the training and the test sets to create one data set.
mergedPath <- file.path(dataPath, "merged")
testPath <- file.path(dataPath, "test")
trainPath <- file.path(dataPath, "train")

dir.create(mergedPath)
dir.create(file.path(mergedPath, file.path("Inertial Signals")))

# copy test files into merged folder
fileListTest <- list.files(testPath, recursive = TRUE)
filesFromTest <- file.path(testPath, fileListTest)
filesToMerged <- file.path(mergedPath, gsub("(_test|_train)", "", fileListTest))
file.copy(filesFromTest, filesToMerged)

# append train files to the files in merged folder
fileListTrain <- list.files(trainPath, recursive = TRUE)
filesFromTrain <- file.path(trainPath, fileListTrain)
file.append( filesToMerged, filesFromTrain )


### 2 ###
# Extracts only the measurements on the mean and standard deviation for each 
# measurement. 

# read original labels
features <- read.table(file.path(dataPath, "features.txt"))
names(features)[1] <- "ID"
names(features)[2] <- "originalLabel" 

# read original
dt <- read.table(file.path(mergedPath, "X.txt"), col.names = features[,2])

# remove columns which labels don't contain mean or std
idxFeaturesWithMeanOrStd <- grep("mean|std", features[,2], ignore.case = TRUE)
dt <- dt[,idxFeaturesWithMeanOrStd]

# add y.txt file as y activity column
activities<-read.table(file.path(mergedPath,"y.txt"))
dt$activity <- activities

# add subject.txt file as subjectNumber column
subjectsId<-read.table(file.path(mergedPath,"subject.txt"))
dt$subjectId <- subjectsId

### CODE BOOK ###
# TODO
#descrip <- c("greendog", "bluecat")
#explanation <- decrip
#explanation <- gsub("green", "It is a green ", explanation)
#explanation <- gsub("blue", "It is a blue ", explanation)
#codebook <- paste("* ",descrip,"\n",explanation,"\n")
#write.table(codebook, "codebook.md", quote = FALSE, row.names = FALSE, col.names = FALSE)

### write.table(dt[1:100,],file.path(mergedPath,"ciccio.txt"))
