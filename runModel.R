source('dataProcess.R')
source('modelBox.R')

dat <- readData()
aa <- dat[,1]
fit <- tslm(aa ~ trend + season)
aa_fit <- forecast(aa, h=6)
zz <- forecast(fit, h=6)
plot(zz)

zz <- seasonal_fit(aa)

init_matrix = diag(season)
n = length(ts) + forecast_step
trend = 1:n
ind = 1:(n-forecast_step)
ts_matrix  = as.data.frame(matrix(rep(init_matrix, length.out = n*season),ncol = season,byrow = T))
dat = data.frame(y = c(ts,rep(0,n - length(ind))), trend = trend, ts_matrix) 
zz = dim(dat)
model_fit = lm(y~., data = dat[ind,-zz[2]], weights = dat[ ind,'trend']^(1/1) )
yhat = predict(model_fit, dat[ ,-zz[2] ])
MSE = mean(( yhat[ind] - dat[ ind , 1 ] )^2)
forecast = yhat[-ind]
result = list()
result$model = model_fit
result$MSE = MSE
result$forecast = as.vector(forecast)
return(result)