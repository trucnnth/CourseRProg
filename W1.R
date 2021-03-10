## Read website by lines instead of the whole thing
con <- url('http://www.jhsph.edu','r')
x <- readLines(con)
head(x)

### Subsetting
x <- c(1, 22, 4, 2, 0)
x[1]

#List
y <- list(1, 'Apple Pie', 12, c('Cinnamon', 'Fillings', 'Pastry'))
y[[4]]

#Double bracket for recursive indexing
y[[4]][[1]] # 'Cinnamon'
y[[c(4,1)]] # 'Cinnamon'

#Square bracket for indexing 'index'
x <- c('a', 'b', 'dd', 'f')
z <- x[x > 'dd']
z
#'f'
s <- x > 'a'
s
#FALSE  TRUE  TRUE  TRUE

#Data Frame
data <- data(mtcars)
colNames <- colnames(mtcars)
head(mtcars[1])
# Dollar sign $ use for literal name, cannot be used for assigned values

#Matrix
x <- matrix(1:6, 2, 3)
x[1, 2] #3
x[, 3] # # 5, 6 

# Set drop = FALSE to return 1x1 matrix instead of 1 scalar value
x[1, 2, drop = FALSE]
# Set drop = FALSE to return matrix instead of vector
x[1, , drop = FALSE]

#Partial Matching
x <- list(aardvard = 1:5, applepie = 7:10)
x$a # [1] 1 2 3 4 5 when there's only aardvard
x$a # NULL when there are 2 'a' elements
x$aa # [1] 1 2 3 4 5
x[['a']] # NULL 
x[['ap', exact = FALSE]] # [1] 7 8 9 10, case sensitive 'aP' return NULL

#Removing NAs
x <- c(1, 3, NA, 8, NA, 9, NA, 5)
bad <- is.na(x) #FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE
x[!bad] #[1] 1 3 8 9 5

#Using complete.cases to remove NA
x <- c(1, 2, NA, 4, 5, NA)
y <- c('a', 1, NA, 'tt', NA, 'ba')
good <- complete.cases(x, y) # x and y must have the same length
# TRUE  TRUE FALSE  TRUE FALSE FALSE
# Take complete cases of x AND y
x[good] #  1 2 4
y[good] #"a"  "1"  "tt"

## Quiz 1, question 11-20
file = '/Users/trucnnth/Downloads/hw1_data.csv'
data <- read.csv(file)
#Q11, 13
str(data)
colnames(data)
#Q12
head(data,2)
#Q13
nrow(data)
#Q14
tail(data,2)
#Q15
data$Ozone[47]
#Q16
sum(is.na(data$Ozone))
#Q17
mean(data$Ozone[complete.cases(data$Ozone)])
#Q18
isntNA <- complete.cases(data[c('Ozone', 'Solar.R', 'Temp')])
cleanData <- data[isntNA, ]
cond <- cleanData$Ozone > 31 & cleanData$Temp > 90
condData <- cleanData[cond, ]
avg <- mean(condData$Solar.R) # 212.8
#Q19
condMonth <- data[data$Month  == 6, ]
avg <- mean(condMonth$Temp) #79.1
#Q20
condMonth <- data[data$Month  == 5, ]
max(condMonth$Ozone, na.rm = TRUE) # 115
