## Downloading the data
```
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip")
unzip("Dataset.zip")
```
## Running the script
It assumes that a ```merged``` folder doesn't exist. The script must run from the same folder from where the previous commands to download and unzip the data set were run.

## 1: Merges the training and the test sets to create one data set.
I'm creating a new set of files in a new folder called ```merged```. As all the files have exaclty the same number of rows, we can safely append the files from the test folder into those of the data folder and save them into the new folder. 

## 2: Extracts only the measurements on the mean and standard deviation for each measurement 
At this point I am combining ```subject.txt```, ```X.txt``` and ```y.txt``` into a single data table.
The files in ```Inertial Signals``` are ignored as not requested for this excercise.  I
From the file ```X.txt``` I'm extracting only those columns which label contains the workd "mean" or "std" case insensitive. I am probably adding extra columns, but as it is not clear what means and std are important, I prefer to have extra columns than too little.


## 3: Uses descriptive activity names to name the activities in the data set
The ```activity_labels.txt``` file contains the activity names. They just need to be stripped by the undersscore and lowercased.

## 4:Appropriately labels the data set with descriptive variable names.
This is about to clean up labels. We have 86 labels and it could be done just manually: one by one. I believe in automatism and therefore I prefer to write some code that can do it for me. The simple idea is to write some simple regular expressions to replaces string so that a label like ```fBodyGyromeanFreq()Z``` will look like ```meanOfTheFrequencyDomainSignalBodyGyroscopeInTheZAx```. Obviously it is not a perfect english, but it is very close and descriptive enough.
The regular expressions where build based on ```features_info.txt``` and intuition.

## 5
## 6
