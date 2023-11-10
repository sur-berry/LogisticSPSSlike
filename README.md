## Automated Logistic Regression Tables akin to SPSS Output

## Introduction

This package provides a streamlined process for generating logistic regression tables in R that closely resemble the output format commonly seen in SPSS software. It is designed for users transitioning from SPSS to R who wish to retain familiarity with the logistic regression output terminology. 

Key features include the calculation of B values (log-odds coefficients) accessible via 'coef(fit)', Odds Ratios (OR) as exponentiated B values obtained through 'exp(coef(fit))', 95% Confidence Intervals (CI) for the OR derived from 'exp(confint(fit))', p-values from the summary of the model fit, and Wald statistics computed as the square of the Z values. 

The package ensures that variable names are consistent with those used in SPSS to reduce confusion and improve workflow efficiency for users accustomed to SPSS outputs.

## Basic usage

```R
# install AER package, the example will use the "Affairs" dataset in the package
if (!require("AER")) install.packages("AER")
library("AER")
data(Affairs)
# recode the vars
Affairs[Affairs$affairs>1,]$affairs<-1
# run the logistic regression using glm function
fit<-glm(affairs~.,data=Affairs,family=binomial())
# format the 
LogisticSPSSlike(fit)
```

## Credits

This package was  developed by [Ruizhi Chai](https://github.com/sur-berry) in collaboration with  [Xiaobao Yang](https://github.com/sur-yang). 
