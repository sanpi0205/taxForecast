library(dplyr)
library(xlsx)

paths <- list(data = 'data/', result='result/')

readData <- function(){
  dataPath <- paste0(paths$data,'data.xls')
  if(!file.exists(dataPath)){
    stop('数据文件不存在，请将数据文件放置于data目录下')
  }
  dat <- read.xlsx(dataPath, sheetName = 'total', startRow = 1,
                   colIndex = 2:5)
  dat <- ts(dat, start = c(2002,1), end = c(2013,12), frequency = 12)
  #数据中存在异常值，最终建模数据从2004年1月开始
  dat_ts <- window(dat, start = c(2004,1))
  colnames(dat_ts) = c('duty','vat','consumption_tax','anti-dumping_tax')
  return(dat_ts)
}

readCommodityData <- function(){
  
}



wirteData <- function(){
  # k
}