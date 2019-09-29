library(dplyr)
library(tidyverse)
library(readr)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

## Load and label data from files

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
test_subject<-tbl_df(test_subject)
test_subject<-test_subject %>% rename(subject=V1)
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
train_subject<-tbl_df(train_subject)
train_subject<-train_subject %>% rename(subject=V1)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",stringsAsFactors = FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",stringsAsFactors = FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_train<-y_train %>% rename(label=V1)
y_test<- y_test %>% rename (label=V1)

body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",stringsAsFactors = FALSE)
body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",stringsAsFactors = FALSE)
body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",stringsAsFactors = FALSE)
body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",stringsAsFactors = FALSE)
body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",stringsAsFactors = FALSE)
body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",stringsAsFactors = FALSE)

body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",stringsAsFactors = FALSE)
body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",stringsAsFactors = FALSE)
body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",stringsAsFactors = FALSE)
body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",stringsAsFactors = FALSE)
body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",stringsAsFactors = FALSE)
body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",stringsAsFactors = FALSE)

total_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",stringsAsFactors = FALSE)
total_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",stringsAsFactors = FALSE)
total_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",stringsAsFactors = FALSE)
total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",stringsAsFactors = FALSE)
total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",stringsAsFactors = FALSE)
total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",stringsAsFactors = FALSE)

features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
names(X_train)<-features[[2]]
names(X_test)<-features[[2]]

## Calculate mean and standard deviation by row for Inertial Signals

total_acc_x_test <- total_acc_x_test %>% mutate(total_acc_x_mean=apply(.[(1:128)],1,mean))
total_acc_y_test <- total_acc_y_test %>% mutate(total_acc_y_mean=apply(.[(1:128)],1,mean)) 
total_acc_z_test <- total_acc_z_test %>% mutate(total_acc_z_mean=apply(.[(1:128)],1,mean)) 
total_acc_x_train <- total_acc_x_train %>% mutate(total_acc_x_mean=apply(.[(1:128)],1,mean)) 
total_acc_y_train <- total_acc_y_train %>% mutate(total_acc_y_mean=apply(.[(1:128)],1,mean)) 
total_acc_z_train <- total_acc_z_train %>% mutate(total_acc_z_mean=apply(.[(1:128)],1,mean)) 

body_acc_x_test <- body_acc_x_test %>% mutate(body_acc_x_mean=apply(.[(1:128)],1,mean)) 
body_acc_y_test <- body_acc_y_test %>% mutate(body_acc_y_mean=apply(.[(1:128)],1,mean)) 
body_acc_z_test <- body_acc_z_test %>% mutate(body_acc_z_mean=apply(.[(1:128)],1,mean)) 
body_acc_x_train <- body_acc_x_train %>% mutate(body_acc_x_mean=apply(.[(1:128)],1,mean))
body_acc_y_train <- body_acc_y_train %>% mutate(body_acc_y_mean=apply(.[(1:128)],1,mean)) 
body_acc_z_train <- body_acc_z_train %>% mutate(body_acc_z_mean=apply(.[(1:128)],1,mean)) 

body_gyro_x_test <- body_gyro_x_test %>% mutate(body_gyro_x_mean=apply(.[(1:128)],1,mean))
body_gyro_y_test <- body_gyro_y_test %>% mutate(body_gyro_y_mean=apply(.[(1:128)],1,mean))
body_gyro_z_test <- body_gyro_z_test %>% mutate(body_gyro_z_mean=apply(.[(1:128)],1,mean)) 
body_gyro_x_train <- body_gyro_x_train %>% mutate(body_gyro_x_mean=apply(.[(1:128)],1,mean))
body_gyro_y_train <- body_gyro_y_train %>% mutate(body_gyro_y_mean=apply(.[(1:128)],1,mean))
body_gyro_z_train <- body_gyro_z_train %>% mutate(body_gyro_z_mean=apply(.[(1:128)],1,mean))

total_acc_x_test<- total_acc_x_test %>% mutate(total_acc_x_std = apply(.[(1:128)],1,sd)) %>% select(total_acc_x_std,total_acc_x_mean)
total_acc_y_test <- total_acc_y_test  %>% mutate(total_acc_y_std=apply(.[(1:128)],1,sd)) %>% select(total_acc_y_std,total_acc_y_mean)
total_acc_z_test <- total_acc_z_test  %>% mutate(total_acc_z_std=apply(.[(1:128)],1,sd)) %>% select(total_acc_z_std,total_acc_z_mean)
total_acc_x_train <- total_acc_x_train  %>% mutate(total_acc_x_std=apply(.[(1:128)],1,sd)) %>% select(total_acc_x_std,total_acc_x_mean)
total_acc_y_train <- total_acc_y_train  %>% mutate(total_acc_y_std=apply(.[(1:128)],1,sd)) %>% select(total_acc_y_std,total_acc_y_mean)
total_acc_z_train <- total_acc_z_train  %>% mutate(total_acc_z_std=apply(.[(1:128)],1,sd)) %>% select(total_acc_z_std,total_acc_z_mean)

body_acc_x_test <- body_acc_x_test  %>% mutate(body_acc_x_std=apply(.[(1:128)],1,sd)) %>% select(body_acc_x_std,body_acc_x_mean)
body_acc_y_test <- body_acc_y_test  %>% mutate(body_acc_y_std=apply(.[(1:128)],1,sd)) %>% select(body_acc_y_std,body_acc_y_mean)
body_acc_z_test <- body_acc_z_test  %>% mutate(body_acc_z_std=apply(.[(1:128)],1,sd)) %>% select(body_acc_z_std,body_acc_z_mean)
body_acc_x_train <- body_acc_x_train  %>% mutate(body_acc_x_std=apply(.[(1:128)],1,sd)) %>% select(body_acc_x_std,body_acc_x_mean)
body_acc_y_train <- body_acc_y_train  %>% mutate(body_acc_y_std=apply(.[(1:128)],1,sd)) %>% select(body_acc_y_std,body_acc_y_mean)
body_acc_z_train <- body_acc_z_train  %>% mutate(body_acc_z_std=apply(.[(1:128)],1,sd)) %>% select(body_acc_z_std,body_acc_z_mean)

body_gyro_x_test <- body_gyro_x_test  %>% mutate(body_gyro_x_std=apply(.[(1:128)],1,sd)) %>% select(body_gyro_x_std,body_gyro_x_mean)
body_gyro_y_test <- body_gyro_y_test  %>% mutate(body_gyro_y_std=apply(.[(1:128)],1,sd)) %>% select(body_gyro_y_std,body_gyro_y_mean)
body_gyro_z_test <- body_gyro_z_test  %>% mutate(body_gyro_z_std=apply(.[(1:128)],1,sd)) %>% select(body_gyro_z_std,body_gyro_z_mean)
body_gyro_x_train <- body_gyro_x_train  %>% mutate(body_gyro_x_std=apply(.[(1:128)],1,sd)) %>% select(body_gyro_x_std,body_gyro_x_mean)
body_gyro_y_train <- body_gyro_y_train  %>% mutate(body_gyro_y_std=apply(.[(1:128)],1,sd)) %>% select(body_gyro_y_std,body_gyro_y_mean)
body_gyro_z_train <- body_gyro_z_train  %>% mutate(body_gyro_z_std=apply(.[(1:128)],1,sd)) %>% select(body_gyro_z_std,body_gyro_z_mean)

## Merge data sets

X_train<-cbind(train_subject, y_train,X_train,
               body_gyro_x_train,body_gyro_y_train,body_gyro_z_train,
               body_acc_x_train,body_acc_y_train,body_acc_z_train,
               total_acc_x_train,total_acc_y_train,total_acc_z_train)


X_test<-cbind(test_subject, y_test,X_test,
              body_gyro_x_test,body_gyro_y_test,body_gyro_z_test,
              body_acc_x_test,body_acc_y_test,body_acc_z_test,
              total_acc_x_test,total_acc_y_test,total_acc_z_test)
X<-rbind(X_train,X_test)

# Extracts only the measurements 
# on the mean and standard deviation for each measurement.

X <- X[grep("^subject$|^label$|mean\\(\\)|std\\(\\)|_std$|_mean$", names(X))]

## Use descriptive activity names to name the activities in the data set

X['label']<- replace(X['label'],c(1,2,3,4,5,6), c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## Average for each activity and each subject

X_AVG <- X %>% group_by(label, subject) %>% summarise_all("mean" )

## Write results to .txt files

write.table(X,file = "X.txt", row.names = FALSE)
write.table(X_AVG,file = "X_AVG.txt", row.names = FALSE)