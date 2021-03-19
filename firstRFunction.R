add2 <- function(x, y) {
    x + y
}

above10 <- function(x){
    x[x > 10]
}

aboveN <- function(x, n = 10){
    x[x > n]
}

colMean <- function(x){
    result <- numeric(ncol(x))
    for (i in 1:ncol(x)){
        result[i] <- mean(x[, i], na.rm = TRUE)
    }
    result
}