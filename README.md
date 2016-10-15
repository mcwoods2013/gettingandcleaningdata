# gettingandcleaningdata
Data repository associated with John Hopkins University Getting and Cleaning Data Coursera Course 2016

This data analysis function tidies and summarizes data from the Human Activity Recognition Using Smartphones Dataset. 
See the associated file "feature_info_revised.txt" for extended details on the acquisition and definition of features
in this data set.

The anaysis script must be run in the directory "UCI HAR Dataset". It will condense the data into a tidy frame called
"mdata" whichwill be present in the workspace. In addition, it will group the data by unique combinations of subject and
activity and provide a summary data set called "smdata" in the workspace. For the summary, each variable from mdata is replaced 
by the mean over each group.
