generate_data<-function()
## This function merge, process and creates the tiny data of the experiment
{
    # Read all raw data in R
    X_test <- read.table("X_test.txt")
    y_test<-read.table("y_test.txt")
    subject_test<-read.table("subject_test.txt")
    X_train <- read.table("X_train.txt")
    y_train<-read.table("y_train.txt")
    subject_train<-read.table("subject_train.txt")
    features <- read.table("features.txt",stringsAsFactors=FALSE)
    activity<- read.table("activity_labels.txt",stringsAsFactors=FALSE)
    
    # Set columns names of vector data to features labels
    names(X_test)<-features[,2]
    names(X_train)<-features[,2]
    
    # Set columns names of subject and labels
    names(subject_test)<-"subject"
    names(y_test)<-"y"
    names(subject_train)<-"subject"
    names(y_train)<-"y"
    
    # Add columns of subject and labels to vector data
    data_test<-cbind(subject_test,y_test,X_test)
    data_train<-cbind(subject_train,y_train,X_train)
    
    # Data clean up
    test<-data_test[,1:563]
    train<-data_train[,1:563]
    
    # Merge train and test data
    print("Merging ...")
    data<-merge(test,train,all=T)
    
    # Extract the variables with mean or std information
    data_summary<-data[,1:2]   # copy subject and label
    for(i in 1:ncol(data))
    {
        # if mean or std string are in the column name then copy to data_summary
        if (grepl("mean()",names(data)[i]) | grepl("std()",names(data)[i]))
        {
            data_summary[,names(data)[i]]<-data[,names(data)[i]]
        }
    }
    
    # Replace descriptive activity names
    for(i in 1:nrow(activity))
    {
        data_summary[data_summary$y==i,]["y"]=activity[i,2]
    }
    names(data_summary)[2]<-"activity"
    data_summary
    
    
}

generate_summ_data<-function(data)
## This function summarize the data finding average per subject and activity
## data must be a data frame
{
    # Read activ data
    activ<- read.table("activity_labels.txt",stringsAsFactors=FALSE)
    
    # Calculates average per subject and activity
    dat_sum<-data[1,3:ncol(data)]
    subject<-numeric()
    label<-character()
    for(i in 1:30)
    {
        for(j in 1:nrow(activ))
        {
            dat2<-as.numeric(colMeans(data[data$subject==i & 
                                               data$activity==activ[j,2],
                                     3:ncol(data)]))
            dat_sum<-rbind(dat_sum,dat2)
            subject<-c(subject,i)
            label<-c(label,activ[j,2])
        }
        
    }
    dat_sum<-dat_sum[-1,]
    dat_sum<-cbind(subject=subject,activity=label,dat_sum)
    dat_sum    
        
}

