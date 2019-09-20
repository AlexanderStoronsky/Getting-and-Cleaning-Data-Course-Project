test_subject <- read.table("C:/DATA/UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
library(dplyr)
library(readr)
library(tidyverse)
test_subject<-tbl_df(test_subject)
test_subject<-test_subject %>% rename(subject=V1)
train_subject <- read.table("C:/DATA/UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
train_subject<-tbl_df(train_subject)
train_subject<-train_subject %>% rename(subject=V1)
y_train <- read.table("C:/DATA/UCI HAR Dataset/train/y_train.txt",stringsAsFactors = FALSE)
X_train <- read.table("C:/DATA/UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("C:/DATA/UCI HAR Dataset/test/y_test.txt",stringsAsFactors = FALSE)
X_test <- read.table("C:/DATA/UCI HAR Dataset/test/X_test.txt")
y_train<-y_train %>% rename(lable=V1)
y_test<- y_test %>% rename (lable=V1)

body_acc_x_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",stringsAsFactors = FALSE)
body_acc_y_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",stringsAsFactors = FALSE)
body_acc_z_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",stringsAsFactors = FALSE)
body_acc_x_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",stringsAsFactors = FALSE)
body_acc_y_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",stringsAsFactors = FALSE)
body_acc_z_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",stringsAsFactors = FALSE)

body_gyro_x_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",stringsAsFactors = FALSE)
body_gyro_y_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",stringsAsFactors = FALSE)
body_gyro_z_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",stringsAsFactors = FALSE)
body_gyro_x_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",stringsAsFactors = FALSE)
body_gyro_y_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",stringsAsFactors = FALSE)
body_gyro_z_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",stringsAsFactors = FALSE)

total_acc_x_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",stringsAsFactors = FALSE)
total_acc_y_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",stringsAsFactors = FALSE)
total_acc_z_test <- read.table("C:/DATA/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",stringsAsFactors = FALSE)
total_acc_x_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",stringsAsFactors = FALSE)
total_acc_y_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",stringsAsFactors = FALSE)
total_acc_z_train <- read.table("C:/DATA/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",stringsAsFactors = FALSE)

features <- read.table("C:/DATA/UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
names(X_train)<-features[[2]]
names(X_test)<-features[[2]]



total_acc_x_test <- total_acc_x_test %>% rowwise() %>% mutate(total_acc_x_mean=mean(V1:V128))
total_acc_y_test <- total_acc_y_test %>% rowwise() %>% mutate(total_acc_y_mean=mean(V1:V128)) 
total_acc_z_test <- total_acc_z_test %>% rowwise() %>% mutate(total_acc_z_mean=mean(V1:V128)) 
total_acc_x_train <- total_acc_x_train %>% rowwise() %>% mutate(total_acc_x_mean=mean(V1:V128)) 
total_acc_y_train <- total_acc_y_train %>% rowwise() %>% mutate(total_acc_y_mean=mean(V1:V128)) 
total_acc_z_train <- total_acc_z_train %>% rowwise() %>% mutate(total_acc_z_mean=mean(V1:V128)) 

body_acc_x_test <- body_acc_x_test %>% rowwise() %>% mutate(body_acc_x_mean=mean(V1:V128)) 
body_acc_y_test <- body_acc_y_test %>% rowwise() %>% mutate(body_acc_y_mean=mean(V1:V128)) 
body_acc_z_test <- body_acc_z_test %>% rowwise() %>% mutate(body_acc_z_mean=mean(V1:V128)) 
body_acc_x_train <- body_acc_x_train %>% rowwise() %>% mutate(body_acc_x_mean=mean(V1:V128))
body_acc_y_train <- body_acc_y_train %>% rowwise() %>% mutate(body_acc_y_mean=mean(V1:V128)) 
body_acc_z_train <- body_acc_z_train %>% rowwise() %>% mutate(body_acc_z_mean=mean(V1:V128)) 

body_gyro_x_test <- body_gyro_x_test %>% rowwise() %>% mutate(body_gyro_x_mean=mean(V1:V128))
body_gyro_y_test <- body_gyro_y_test %>% rowwise() %>% mutate(body_gyro_y_mean=mean(V1:V128))
body_gyro_z_test <- body_gyro_z_test %>% rowwise() %>% mutate(body_gyro_z_mean=mean(V1:V128)) 
body_gyro_x_train <- body_gyro_x_train %>% rowwise() %>% mutate(body_gyro_x_mean=mean(V1:V128))
body_gyro_y_train <- body_gyro_y_train %>% rowwise() %>% mutate(body_gyro_y_mean=mean(V1:V128))
body_gyro_z_train <- body_gyro_z_train %>% rowwise() %>% mutate(body_gyro_z_mean=mean(V1:V128))

total_acc_x_test <- total_acc_x_test %>% rowwise() %>% mutate(total_acc_x_std=sd(V1:V128)) %>% select(total_acc_x_std,total_acc_x_mean)
total_acc_y_test <- total_acc_y_test %>% rowwise() %>% mutate(total_acc_y_std=sd(V1:V128)) %>% select(total_acc_y_std,total_acc_y_mean)
total_acc_z_test <- total_acc_z_test %>% rowwise() %>% mutate(total_acc_z_std=sd(V1:V128)) %>% select(total_acc_z_std,total_acc_z_mean)
total_acc_x_train <- total_acc_x_train %>% rowwise() %>% mutate(total_acc_x_std=sd(V1:V128)) %>% select(total_acc_x_std,total_acc_x_mean)
total_acc_y_train <- total_acc_y_train %>% rowwise() %>% mutate(total_acc_y_std=sd(V1:V128)) %>% select(total_acc_y_std,total_acc_y_mean)
total_acc_z_train <- total_acc_z_train %>% rowwise() %>% mutate(total_acc_z_std=sd(V1:V128)) %>% select(total_acc_z_std,total_acc_z_mean)

body_acc_x_test <- body_acc_x_test %>% rowwise() %>% mutate(body_acc_x_std=sd(V1:V128)) %>% select(body_acc_x_std,body_acc_x_mean)
body_acc_y_test <- body_acc_y_test %>% rowwise() %>% mutate(body_acc_y_std=sd(V1:V128)) %>% select(body_acc_y_std,body_acc_y_mean)
body_acc_z_test <- body_acc_z_test %>% rowwise() %>% mutate(body_acc_z_std=sd(V1:V128)) %>% select(body_acc_z_std,body_acc_z_mean)
body_acc_x_train <- body_acc_x_train %>% rowwise() %>% mutate(body_acc_x_std=sd(V1:V128)) %>% select(body_acc_x_std,body_acc_x_mean)
body_acc_y_train <- body_acc_y_train %>% rowwise() %>% mutate(body_acc_y_std=sd(V1:V128)) %>% select(body_acc_y_std,body_acc_y_mean)
body_acc_z_train <- body_acc_z_train %>% rowwise() %>% mutate(body_acc_z_std=sd(V1:V128)) %>% select(body_acc_z_std,body_acc_z_mean)

body_gyro_x_test <- body_gyro_x_test %>% rowwise() %>% mutate(body_gyro_x_std=sd(V1:V128)) %>% select(body_gyro_x_std,body_gyro_x_mean)
body_gyro_y_test <- body_gyro_y_test %>% rowwise() %>% mutate(body_gyro_y_std=sd(V1:V128)) %>% select(body_gyro_y_std,body_gyro_y_mean)
body_gyro_z_test <- body_gyro_z_test %>% rowwise() %>% mutate(body_gyro_z_std=sd(V1:V128)) %>% select(body_gyro_z_std,body_gyro_z_mean)
body_gyro_x_train <- body_gyro_x_train %>% rowwise() %>% mutate(body_gyro_x_std=sd(V1:V128)) %>% select(body_gyro_x_std,body_gyro_x_mean)
body_gyro_y_train <- body_gyro_y_train %>% rowwise() %>% mutate(body_gyro_y_std=sd(V1:V128)) %>% select(body_gyro_y_std,body_gyro_y_mean)
body_gyro_z_train <- body_gyro_z_train %>% rowwise() %>% mutate(body_gyro_z_std=sd(V1:V128)) %>% select(body_gyro_z_std,body_gyro_z_mean)



X_train<-cbind(train_subject, y_train,X_train,
               body_gyro_x_train,body_gyro_y_train,body_gyro_z_train,
               body_acc_x_train,body_acc_y_train,body_acc_z_train,
               total_acc_x_train,total_acc_y_train,total_acc_z_train)


X_test<-cbind(test_subject, y_test,X_test,
              body_gyro_x_test,body_gyro_y_test,body_gyro_z_test,
              body_acc_x_test,body_acc_y_test,body_acc_z_test,
              total_acc_x_test,total_acc_y_test,total_acc_z_test)
X<-rbind(X_train,X_test)
