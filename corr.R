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