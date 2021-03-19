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
    col <- ncol(x)
    result <- numeric(col)
    for (i in 1:col){
        result[i] <- mean(x[, i], na.rm = TRUE)
    }
    result
}