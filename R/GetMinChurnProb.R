#setwd("~/Downloads/R/day5/")
#install.packages("data.table")
library(data.table)

#### for testing ####
#customer_data <- fread('~/Downloads/R/day5/data_customer.csv')
#personal_data <- fread('~/Downloads/R/day5/data_personal.csv')
#
#full_data <- merge(customer_data, personal_data, by="CustomerId")
#
#full_data[, Exited:=as.factor(Exited)]
#full_data[, Gender:=as.factor(Gender)]
########

GetMinChurnProb <- function(data){
  churn_prob_model <- glm(data$Exited ~ data$CreditScore + data$Gender + data$Age + data$Age + data$Tenure + data$Balance + data$NumOfProducts + data$HasCrCard + data$IsActiveMember + data$EstimatedSalary, family="binomial")
  churn_pred <- predict(churn_prob_model, data, type="response")
  data <- cbind(data, churn_pred)
  return(data[which.min(data$churn_pred), churn_pred])
}

#GetMinChurnProb(full_data)
