df<-read.csv("Student_Performance.csv")
df

df<-na.omit(df)
df

install.packages("caTools")
library(caTools)
install.packages("scatterplot3d")
library(scatterplot3d)
s<-sample.split(df$Hours.Studied+df$Sleep.Hours, df$Performance.Index, SplitRatio=0.6)
training_set<-subset(df, s==TRUE)
training_set

testing_set<-subset(df, s==FALSE)
testing_set

model <- lm(Performance.Index~Hours.Studied+Sleep.Hours, data = training_set)
summary(model)

scatterplot3d(training_set$Hours.Studied, training_set$Sleep.Hours, training_set$Performance.Index, xlab = "Hours Studied", ylab = "Sleep Hours", zlab = "Performance Index", main = "3D Scatter Plot of Performance Index")
