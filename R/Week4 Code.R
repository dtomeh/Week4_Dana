#R Studio API Code
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


#Data Import
library(tidyverse)
week4_df <- read_delim("../Data/week4.dat", delim ="-", col_names= c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(week4_df)
week4_df <- separate(week4_df, qs, c("q1", "q2", "q3", "q4", "q5"))
week4_df[5:9] <- sapply(week4_df[5:9], as.numeric)
week4_df <- complete(week4_df, )
week4_df[, 5:9][week4_df[ 5:9]==0] <-NA



week4_df$datadate <- lubridate::mdy_hms(week4_df$datadate)


#Data Analysis
q2_over_time_df <- spread(week4_df[, c("parnum", "stimver", "q2")],stimver,q2) 
mean(complete.cases(q2_over_time_df))