#Q1
cube <- function(x, n){
    x ^ 3
}
# return a number 27

#Q2
x <- 1:10
if(x>5){
    x <- 0
}
# x is a vector, if takes single value

#Q3
f <- function(x) {
    g <- function (y) {
        y + z
    }
    z <- 4
    x + g(x)
}

z <- 10
f(3) #10

#Q4
x <- 5
y <- if(x < 3) {
    NA
} else {
    10
} #y = 10

#Q5
# free variable f

#Q6
# environment in R a collection of symbol/value pairs

#Q7
#scoping rule for resolving free variables = lexical scoping

#Q8
#value of free variables are searched for in the environment in which the function was defined

#Q9
#Consequences of scoping rules = all objects must be stored in memory

#Q10 
#Parent frame = where function is called