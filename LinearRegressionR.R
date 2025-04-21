df<-read.csv("Experience-Salary.csv")
df

df<-na.omit(df)
df

install.packages("caTools")
library(caTools)
s<-sample.split(df$exp.in.months., df$salary.in.thousands., SplitRatio=0.6)
training_set<-subset(df, s==TRUE)
training_set

testing_set<-subset(df, s==FALSE)
testing_set

model <- lm(salary.in.thousands.~ exp.in.months., data = training_set)
summary(model)

pred_sal=predict(model, testing_set)
pred_sal

plot(training_set$exp.in.months., training_set$salary.in.thousands.,xlab = "YearsExperience", ylab = "Salary", main = "Linear Regression")
abline(model, col = "red")
