unzip('rprog_data_specdata.zip')

#directory = specdata
pollutantmean <- function(directory, pollutant, id){
    pathName <- paste(directory,'/',formatC(id, width = 3, flag = 0), '.csv', sep = '')
    dataList <- lapply(pathName, read.csv)
    dataFull <- do.call(rbind, dataList)
    avg <- mean(dataFull[, pollutant], na.rm = TRUE)
}