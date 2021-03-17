unzip('rprog_data_specdata.zip')

#directory = specdata
pollutantmean <- function(directory, pollutant, id = 1:332){
    pathName <- paste(directory,'/',formatC(id, width = 3, flag = 0), '.csv', sep = '')
    dataList <- lapply(pathName, read.csv)
    dataFull <- do.call(rbind, dataList)
    round(mean(dataFull[, pollutant], na.rm = TRUE),3) #round to 3 digits for quiz
}

complete <- function(directory, id = 1:332){
    pathName <- paste(directory,'/',formatC(id, width = 3, flag = 0), '.csv', sep = '')
    dataList <- lapply(pathName, read.csv)
    completeID <- lapply(dataList,complete.cases)
    total <- lapply(completeID, sum)
    nobs <- do.call(rbind, total)
    dataFrame <- data.frame(id, nobs)
}

corr <- function(directory, threshold = 0){
    pth <- list.files(directory, full.names = TRUE)
    ls <- lapply(pth, read.csv)
    cmp <- lapply(ls, complete.cases)
    nobs <- lapply(cmp, sum)
    cr <- numeric()
    for (i in seq_along(ls)){
        if (nobs[[i]] > threshold){
            dt <- ls[[i]][cmp[[i]],]
            cr <- c(cr,cor(x = dt$sulfate, y = dt$nitrate))
        }
        else{NULL}
    }
    cr
}