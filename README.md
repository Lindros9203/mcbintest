# mcbintest
R package for multiple comparisons of several binomial distributions
## Motivation
This package was developed because of the need of applicable statistical procedure to compare numbers (proportions, respectively) of dead and alive trees after experiment between selected treatments. In our case, we were evaluating three variants of fertilization applied to young trees and recording number of surviving and dead individuals. The sample table is included (under name ```testtab```).
## Method, reference
Method used in this package is described in article by Agresti, Bini et al. (2008). Full citation:

Agresti, A., Bini, M., Bertacinni, B., & Ryu, E. (2008). Simultaneous confidence intervals for comparing binomial parameters. Biometrics, 64, 1270-1275. 
## Installation
To install this package, simply run following commands in the R environment.
```r
install.packages("devtools")
library(devtools)
install_github("Lindros9203/mcbintest")
library(mcbintest)
```
## Contents of the package
The package contains the ```bin.test``` function. The function has one input, which should be formatted as data frame (see below). The first row of the table is its header (here shown in **bold**). The package also includes ```print.bintest``` function for formatting the results and sample table ```testtab```.

## Usage
```r
bin.test(input_table)
```

## Input data
The input data should be in following form:


| Treatment     	| Outcome 1 	| Outcome 2 	| Total  	|
|---------------:	|:---------:	|:---------:	|:------------------:	|
| First option  	|     a     	|     b     	|         Sum of row 1 (a+b)        	|
| Second option 	|     c     	|     d     	|         c+d        	|
| Third option  	|     f     	|     g     	|         f+g        	|
|      ...      	|    ...    	|    ...    	|        ...       	|

The "a, b and x" stands for counts of cases in respective treatment/outcome combination.
The table shoud be of class ```data.frame```.

## Output
**mc:**
This table contains information about multiple comparisons result. The numbers in first two columns depict ID (order) of currently compared treatmets from input table.

**CI:**
Confidence intervals of probability (ratio) of numbers in second/third column of input table. This ratio is always computed as count of cases defined in second column/count of cases defined in third column. 

**errbars:**
This table shows error bars distances (95%) for plotting the result.

**obs_variable:**
Variable (defined as name of second column of the input table) for which the ratio is computed.

## Example
For example, input
```r
bin.test(testtab)
```
into R console.
## Notes
This package probably needs a lot of improvements. If you want to help with development, e.g. add the treatment names into output tables instead of its ID from input table, feel free to contact me or do whatever you want with the package.
