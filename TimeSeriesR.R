df<-read.csv("Month_Value_1.csv")
df

df<-na.omit(df)
df

ts_data<-ts(df$Revenue, start=c(2015,1), frequency=12)
ts_data
plot(ts_data)

de<-decompose(ts_data)
plot(de)

install.packages("tseries")
library(tseries)

adf_result <- adf.test(ts_data)
print(adf_result)

ts_data1<-diff(ts_data)
plot(ts_data1)

de1<-decompose(ts_data1)
plot(de1)

model<-arima(ts_data1, order=c(2,1,1))
pred_data<-forecast(model, h=20)
plot(pred_data)