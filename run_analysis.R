


### Import information for the analysis

#Train sample
x_train<-read.table("X_train.txt")
names(x_train)
dim(x_train)
lab_train<-read.table("y_train.txt")
sub_train<-read.table("subject_train.txt")

#Test sample
x_test<-read.table("X_test.txt")
dim(x_test)
lab_test<-read.table("y_test.txt")
sub_test<-read.table("subject_test.txt")



subject_all<-rbind(sub_train, sub_test)
y_all<-rbind(lab_train,lab_test)
x_all<-rbind(x_train,x_test)



names(subject_all)<-c("subject")
names(y_all)<-c("activity")
features<-read.table("features.txt",head=FALSE)
names(x_all)<-features$V2


#1. Merges the data bases to create one data set.

all_tt<-cbind(subject_all,y_all)
head(all_tt)
names(all_tt)
dim(all_tt)


data<-cbind(x_all,all_tt)
head(data)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

data_mean<-features$V2[grep("mean\\(\\)|std\\(\\)",features$V2)]
mean_std<-c(as.character(data_mean),"subject","activity")
data1<-subset(data,select=mean_std)
dim(data1)
head(data1)
tail(data1)

#3. Uses descriptive activity names to name the activities in the data set

data1$activity<-as.character(data1$activity)
data1$activity[data1$activity==1]<-"Walking"
data1$activity[data1$activity==2]<-"Walking Upstairs"
data1$activity[data1$activity==3]<-"Walking Downstairs"
data1$activity[data1$activity==4]<-"Sitting"
data1$activity[data1$activity==5]<-"Standing"
data1$activity[data1$activity==6]<-"Laying"
data1$activity<-as.factor(data1$activity)


#4. Appropriately labels the data set with descriptive variable names.

names(data1)<-gsub("^f","frequency",names(data1))
names(data1)<-gsub("^t","time",names(data1))
names(data1)<-gsub("Acc","Accelerometer",names(data1))
names(data1)<-gsub("BodyBody","Body",names(data1))
names(data1)<-gsub("Gyro","Gyroscope",names(data1))
names(data1)<-gsub("Mag","Magnitude",names(data1))


#5. From the data set in step 4, creates a second, independent tidy data 
#set with the average of each variable for each activity and each subject.


library(data.table)
data1_exp<-data.table(data1)

final_data<-data1_exp[, lapply(.SD, mean), by = 'subject,activity']
write.table(final_data, file = "final_data.txt", row.names = FALSE)


