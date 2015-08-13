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


## 3
## 4
## 5
## 6
