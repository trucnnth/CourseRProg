library(datasets)
data(iris)
head(iris)
str(iris)

#Q1
round(mean(iris[iris$Species == 'virginica', "Sepal.Length" ]), 0)

#Q2
m <- as.numeric(lapply(iris[, 1:4], mean))
m2 <- apply(iris[, 1:4], 2, mean)


#Q3
library(datasets)
data(mtcars)
head(mtcars)

perCyl <- tapply(mtcars$mpg, mtcars$cyl, mean) # 3 values
length(unique(mtcars$cyl)) # 3 values, matching 3 index values of tapply
perCyl2 <- tapply(mtcars$cyl, mtcars$mpg, mean) #25 values
length(unique(mtcars$mpg)) # 25 values

perCyl2 <- with(mtcars, tapply(mpg, cyl, mean))
perCyl == perCyl2

perCyl2 <- sapply(split(mtcars$mpg, mtcars$cyl), mean)
perCyl == perCyl2

#Q4
hpCyl <- tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(hpCyl[1] - hpCyl[3]), 0) #127 
