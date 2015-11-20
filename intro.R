## intro to R

# asking for help
?sqrt
sqrt(10)
 
# some commands have dafaults
round( 2.32239847239847)  # nearest whole number
round( 2.322303948, digits = 2 ) # adding parameters.
?round
args(round)

#searching for help
help.search("anova")

# creating objects
5+5 # simple math
# assignment operator
weight_kg <- 55
height = 45
(wight_kg <- 33) # assign object and print to console
weight_kg = 55
wight_lb <- weight_kg * 2.2

# vectors and other data types
# c - combine
weight <- c(50,60,65,82)

weight # recall object values
weight[2:3]
weight[1:6]

animals <- c("mouse", "rat", "ted")

# tools > global options
#    code > edit > check "soft-wrap R sourcefile"....

length(weight)
length(animals)
class(weight)
class(animals)
#str > structure
str(weight)

weight <- c(weight, 90) # add value to end of vector
weight <- c(30,weight) # add value to beginning of a vector

plot(rnorm(100))

# remove evertyhong in your environment
rm( list = ls() ) 

# download data 
download.file("http://k8hertweck.github.io/2015-11-19-umiami-R/data/gapminder-FiveYearData.csv", "data/gapminder.csv")

# relative path
#  ~ (tilda means home directory)
download.file("http://k8hertweck.github.io/2015-11-19-umiami-R/data/gapminder-FiveYearData.csv", "~/Desktop/gapminder.csv")

# import data into R
read.csv("data/gapminder.csv")

# gapminder is a dataframe
gapminder <- read.csv("data/gapminder.csv")

# check the data frame.
str(gapminder)

# Ctrl + L will clean the console

# checking data type
class(gapminder)
head(gapminder)

# extract data
# extract first row, first column
gapminder[1,1]

# extract 5th column, 3rd raw
gapminder[5,3]

# extract 2 ~ 6 rows (first), 1~2 columns
gapminder[2:6, 1:2]

# select non-contiguous values
gapminder[ c(2,7,10), c(1,3)]

# column value - blank > select all columns in that row
# select a row
gapminder[5,]
# select all rows
gapminder[ ,5]
# save to object , one column
lifeExp <- gapminder[ ,5]
str(lifeExp)

# mean of life expectancy
mean(lifeExp)
mean( gapminder[ ,5] )
# select a column using a header name
mean( gapminder$lifeExp ) 

# create an object average of each column
# with two column
# selectively only 3, 5, 6 columns only
# 2 for columns calculation (before mean)
# 1 for rows
averageColumn <- apply( gapminder[ , c(3,5,6) ], 2, mean)
# show the result
averageColumn

# min, max, median, sd: other useful summary stats.

## creating functions
g2kg <- function(x) x/1000
g2kg(10)
weights <- c(2,3,4,5)
g2kg(weights)

g2kg2 <-function(x,y)
{
  x * y 
}
g2kg2(4,3)

se <- function(x) 
{
  l <- length(x)
  sq <- sqrt(l)
  sd(x) / sq
}
se(weights)

se2 <- function(x) sqrt( var(x) / length(x) )
se2(weights)

# check type
class(se2)
str(se2)

# create a function that converts from decimal to percentage
d2p <- function(x)
{
  x * 100
  return x
}
d2p(0.4)
# below does not work. R is case sensative
D2P(0.2)

## plot
plot(gapminder$year, gapminder$lifeExp)
plot(gapminder$lifeExp, gapminder$year)
plot(gapminder$lifeExp)
generateText <- function(x){
  ind <- toString(x)
  base01 <- "figures/figure"
  base02 <- ".pdf"
  filename <- paste(base01, ind, base02)
  return(filename)
}

repeatPlot <- function(x)
{
  for (i in 1:x)
  {
    filename = generateText(i)
    pdf(filename)
    plot(gapminder$lifeExp)
    dev.off()
  }
}
repeatPlot(40)

## stat
help.search("anova")

# anova
fit <- aov(lifeExp ~ country, data = gapminder)
fit
summary(fit)

# t test
data(sleep)
head(sleep)
?sleep

# unpaired 5 test
t.test(extra ~ group, data=sleep)

#paired t test
with(sleep, t.test(extra[group == 1], extra[group==2], paired = TRUE))

# loading packages
install.packages("openintro")
library(openintro)

# no need to install anymore
install.packages("dplyr")
install.packages("ggplot2")
# but need to run library( ) function everytime.
library(dplyr)
library(ggplot2)
