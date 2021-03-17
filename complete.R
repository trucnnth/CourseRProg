unzip('rprog_data_specdata.zip')

complete <- function(directory, id = 1:332){
    pathName <- paste(directory,'/',formatC(id, width = 3, flag = 0), '.csv', sep = '')
    dataList <- lapply(pathName, read.csv)
    completeID <- lapply(dataList,complete.cases)
    total <- lapply(completeID, sum)
    nobs <- do.call(rbind, total)
    dataFrame <- data.frame(id, nobs)
}