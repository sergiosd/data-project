
# data-project

**The data set files along wiht the R script to process that data and generate the tidy data (processData.R) must be in the same directory**

The user must load the R script and then execute the function generate_data() which returns a data frame with tiny data of the mean and std vectors explained in raw data description and the function generate_summ_data(data) which returns a summary of the data dataframe with the average of each subject and activity:

> source("%PATH%/processData.R")

> data<-generate_data()

> dat<-genereate_summ_data(data)
