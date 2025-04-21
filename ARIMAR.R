df<-read.csv("Month_Value_1.csv")
df

df<-na.omit(df)
df

ts_data<-ts(df$Revenue, start=c(2015,1), frequency=12)
ts_data
plot(ts_data)

install.packages("tseries")
library(tseries)

adf_result <- adf.test(ts_data)
print(adf_result)

ts_data1<-diff(ts_data)
plot(d_data)

adf_result <- adf.test(ts_data1)
print(adf_result)

install.packages("forecast")
library(forecast)

model<-arima(ts_data1, order=c(2,1,1))
pred_data<-forecast(model, h=20)
plot(pred_data)

acf(d_data, lag.max=6)
pacf(d_data, lag.max=6)