#Load the datasets
#Assumes the current working directory is the root 
#directory of the "UCI HAR Dataset"; e.g. "test" and "train"
#should be sub-folders of the current directory.

#Load raw tables X_train, y_train, X_test, y_test,
#subject_train, and subject_test
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#Load the full set of 561 feature labels
flabels <- read.table("features.txt")
#Find the indicies for the measurement means
indx_mean <- grep("mean()",flabels$V2)
#Find the indicies for the measurement standard deviations
indx_std <- grep("std()",flabels$V2)
#Load the list of activity labels
alabels <- read.table("activity_labels.txt")

#Add the variable datause to the end of X_train and
#X_test to indicate if it is training or test data. That
#way, the information will be retained when the data sets are
#merged
X_train <- cbind(X_train,"train")
X_test <- cbind(X_test,"test")
n <- dim(X_train)[2]
names(X_train)[n] <- "datause"
names(X_test)[n] <- "datause"

#Create Merged Set by row concatenation.
#Only include the mean and std features
#as determined by the grep above as well as
#the datause field
mdata <- rbind(X_train[c(indx_mean,indx_std,n)], 
               X_test[c(indx_mean,indx_std,n)])
#Add columns to the right with the variables subject and activity
mdata <- cbind(
  cbind(rbind(subject_train,subject_test),rbind(y_train,y_test)),
  mdata)
#Set the feature labels
names(mdata) <- (c("subject","activity",
                  as.character(flabels[indx_mean,2]),
                  as.character(flabels[indx_std,2]),
                  "datause"))