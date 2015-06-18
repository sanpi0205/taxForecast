library(dplyr)
library(forecast)

# 模型工具箱中所有模型
model_box <- c('seasonal_fit', 'model_cv')

# 趋势预测
seasonal_fit <- function(ts, forecast_step = 6, season = 12){
  # 季节分解方法，输出预测值
  if(!is.ts(ts)){
    stop('输入时间序列')
  }
  model <- tslm(ts ~ trend + season)
  result <- forecast(model, h = forecast_step)
  return(as.vector(result$mean))
  
}

multi_regression <- function(ts, x, new_x, forecast_step = 6, season = 12){
  # 多元预测模型，考虑外生变量
  
  
}

model_cv <- function(ts, model, forecast_step = 6){
  
}