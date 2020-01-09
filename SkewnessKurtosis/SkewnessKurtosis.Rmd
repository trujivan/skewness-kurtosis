---
title: "Skewness and Kurtosis"
author: "Vanessa Trujillo"
date: "3/18/2019"
output: html_document
---

```{r setup, include=TRUE}
knitr::opts_chunk$set(echo = TRUE)

# Skewness and kurtosis statistics are used to assess normality or lack thereof during EDA. These statistics are affected by distributional shape and sample size. This exercise will investigate how variable the skewness statistic is when sampling from a standard normal distribution. The results will provide a baseline for evaluating data samples in the future. The skewness for the standard normal distribution is 0.0. Samples from a normal distribution will depart from this number, sometimes substantially.
 
# Problem Statement (10 points)

# The function defined below may be used to generate the samples for a given n. This function produces a 1000 x n dimensional array.


# Load the “moments” package which supplies skewness() and kurtosis() functions. Use three different samples size: 10, 40 and 100. For each sample size, draw 1000 random samples, and compute the skewness for each. Use par(mfrow = c(3, 1)) and present histograms for these results. Compute the 2.5% (0.025) and 97.5% (0.975) quantiles for each histogram and present.
library(moments)
library(HistogramTools)
# set.seed(1237) 
# randsam <- rnorm(1000, mean = 0, sd = 1) 

sample <- function(n){
  set.seed(1234)
  result <- matrix(0, nrow = 1000, ncol = n)
  for (k in 1:1000) {
    result[k, ] <- rnorm(n, mean = 0, sd = 1)
  }
  return(result)
}


sample10 <- sample(10)
sample40 <- sample(40)
sample100 <- sample(100)

#SKEWNESS

# Use apply() to compute the skewness for each row.
# In the following code ‘chunk,’ you will need to add code passing each 1000 x n matrix to an instance of apply(). Your matrices will be passed to apply() as X. You must specify MARGIN = 1 and FUN = skewness to have skewness calculated for each row; MARGIN = 2 would calculate the skewness for each column.
Sk10 <- apply(sample10, MARGIN = 1, FUN = skewness)
Sk40 <- apply(sample40, MARGIN = 1, FUN = skewness)
Sk100 <- apply(sample100, MARGIN = 1, FUN = skewness)

# You will then present the vectors of skewness results for n = 10, 40 and 100 as histograms  
par(mfrow = c(3, 1))
hist(Sk10, main = "Histogram of Skewness; n = 10", col = "violet", xlab = "skewness")
hist(Sk40, main = "Histogram of Skewness; n = 40", col = "orange", xlab = "skewness")
hist(Sk100, main = "Histogram of Skewness; n = 100", col = "pink", xlab = "skewness")

# determine the first and third quartiles using quantile().
quantile(Sk10, 0.025)
quantile(Sk10, 0.975)

quantile(Sk40, 0.025)
quantile(Sk40, 0.975)

quantile(Sk100, 0.025)
quantile(Sk100, 0.975)



#KURTOSIS

# Use apply() to compute the skewness for each row.
# In the following code ‘chunk,’ you will need to add code passing each 1000 x n matrix to an instance of apply(). Your matrices will be passed to apply() as X. You must specify MARGIN = 1 and FUN = skewness to have skewness calculated for each row; MARGIN = 2 would calculate the skewness for each column.
K10 <- apply(sample10, MARGIN = 1, FUN = kurtosis)
K40 <- apply(sample40, MARGIN = 1, FUN = kurtosis)
K100 <- apply(sample100, MARGIN = 1, FUN = kurtosis)

# You will then present the vectors of skewness results for n = 10, 40 and 100 as histograms  
par(mfrow = c(3, 1))
hist(K10, main = "Histogram of Kurtosis; n = 10", col = "violet", xlab = "kurtosis")
hist(K40, main = "Histogram of Kurtosis; n = 40", col = "orange", xlab = "kurtosis")
hist(K100, main = "Histogram of Kurtosis; n = 100", col = "pink", xlab = "kurtosis")

# determine the first and third quartiles using quantile().
quantile(K10, 0.025)
quantile(K10, 0.975)

quantile(K40, 0.025)
quantile(K40, 0.975)

quantile(K100, 0.025)
quantile(K100, 0.975)


```

