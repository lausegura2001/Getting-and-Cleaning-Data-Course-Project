
setwd("/home/laura/Documents/Data_Science_Coursera/Data_Cleaning/Week4_Project_UCIHAR_Dataset")

library("dplyr")
library("reshape2")

# 1st Part: Merge the test and train datasets 

# 1.1 Read the data in the test and train folders

sub_ts <- read.table("./test/subject_test.txt")
# Each row identifies the subject whi performed the activity [1-30]

x_ts <- read.table("./test/X_test.txt") 
# A 561-feature vector with time and frequency domain variables.
# In other words, the spectrum

y_ts <- read.table("./test/y_test.txt") 
# Labels with activities

sub_tr <- read.table("./train/subject_train.txt")
# Each row identifies the subject whi performed the activity [1-30]

x_tr <- read.table("./train/X_train.txt") 
# A 561-feature vector with time and frequency domain variables.
# In other words, the spectrum

y_tr <- read.table("./train/y_train.txt") 
# Labels with activities

# 1.2 Merge the data

train <- cbind(sub_tr,y_tr,x_tr)
test <- cbind(sub_ts,y_ts,x_ts)

total <- rbind(test,train)

# 2nd part: Extracts only the measurements on the mean and standard 
# deviation for each measurement.

features <- read.table("features.txt")

# 2.1 Taking the index of mean and std values

index_mean <- grep("mean()",features[,2])
index_mean2 <- grep("meanFreq",features[,2])
index_std <- grep("std()",features[,2])

ind <- match(index_mean2,index_mean)
index_mean[ind] = NA
index_mean <- index_mean[which(index_mean>0)]

# 2.2 Rearranging the index in a way that the data is mean(V1), std(V1), 
# mean(V2),std(V2), ...

li <- length(index_mean)
index <- numeric(length=li*2)

j <- 1
for (i in 1:li){
  index[j] <- index_mean[i]
  index[j+1] <- index_std[i]
  j <- j+2
}

names_index <-features[index,2] # names of columns
index2 <- index+2 # since in the total matrix, features start at column 3
total_mean_std <- cbind(total[,1:2],total[,index2])

# 3rd Part: Use descriptive activity names to name
# the activities in the data set.

act <- read.table("activity_labels.txt")
actc <- as.character(act[,2])

tt <-factor(total_mean_std[,2],labels=actc)
total_mean_std[,2] <- tt

# 4th Part: Appropriately label the data set with descriptive 
# variable names.

new_names <- tolower(names_index)     # lowercase
new_names <- sub("-","_",new_names)   # replace - by _
new_names <- sub("\\()","",new_names) # remove ()
new_names <- sub("-","_",new_names)   # replace - by _

colnames(total_mean_std) <-c("subject","activity",new_names)

# 5th Part; From the data set in step 4, create a second, independent tidy 
# data set with the average of each variable for each activity and 
# each subject.

total_final <-recast(total_mean_std,subject+activity~variable,mean,id.var=c("subject","activity"))

write.csv(total_final,"Tidy_Data_Set.csv")