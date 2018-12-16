Lab5
================

Prepare
-------

#### Helper function to download data

``` r
load_file_data <- function(directory, id) {
  read.csv(paste(directory, sprintf("%03d.csv", id), sep="/"))
}
```

Task 1
------

#### Написати функцію pmean, яка обчислює середнє значення (mean) забруднення сульфатами або нітратами серед заданого переліка моніторів. Ця функція приймає три аргументи: «directory», «pollutant», «id». Directory – папка, в якій розміщені дані, pollutant – вид забруднення, id – перелік моніторів. Аргумент id має значення за замовчуванням 1:332. Функція повинна ігнорувати NA значення.

-   Implementation:

``` r
pmean <- function(directory, pollutant, id = 1:332) {
  #Gather requested data to one frame 
  data <- data.frame()
  for(i in id) {
    data <- rbind(data, load_file_data(directory, i))
  }
  #Perform logic
  return(mean(data[,pollutant], na.rm = TRUE))
}
```

-   Examples

``` r
pmean("specdata", "sulfate", 1:10)
```

    ## [1] 4.064128

``` r
pmean("specdata", "nitrate", 3)
```

    ## [1] 0.6530321

Task 2
------

#### Написати функцію complete, яка виводить кількість повних спостережень (the number of completely observed cases) для кожного файлу. Функція приймає два аргументи: «Directory» та «id» та повертає data frame, в якому перший стовпчик – ім’я файлу, а другий – кількість повних спостережень.

-   Implementation:

``` r
complete <- function(directory, id) {
  data <- data.frame()
  for(i in id) {
    #Count complete cases for each file
    compl_sum <- sum(complete.cases(load_file_data(directory, i)))
    #Add to result data frame
    data <- rbind(data, data.frame(i, compl_sum))
  }
  return (data)
}
```

-   Examples

``` r
complete("specdata", 1)
```

    ##   i compl_sum
    ## 1 1       117

``` r
complete("specdata", c(2, 4, 8, 10, 12))
```

    ##    i compl_sum
    ## 1  2      1041
    ## 2  4       474
    ## 3  8       192
    ## 4 10       148
    ## 5 12        96

``` r
complete("specdata", 50:60)
```

    ##     i compl_sum
    ## 1  50       459
    ## 2  51       193
    ## 3  52       812
    ## 4  53       342
    ## 5  54       219
    ## 6  55       372
    ## 7  56       642
    ## 8  57       452
    ## 9  58       391
    ## 10 59       445
    ## 11 60       448

Task 3
------

#### Написати функцію corr, яка приймає два аргументи: directory (папка, де знаходяться файли спостережень) та threshold (порогове значення, за замовчуванням дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів, кількість повних спостережень для яких більше порогового значення. Функція повинна повернути вектор значень кореляцій. Якщо ні один монітор не перевищує порогового значення, функція повинна повернути numeric вектор довжиною 0. Для обчислення кореляції між сульфатами та нітратами використовуйте вбудовану функцію «cor» з параметрами за замовчуванням.

-   Implementation:

``` r
corr <- function(directory, threshold = 0) {
  res_v <- c()
  for(i in 1:332) {
    #Download data and filter complete cases
    df <- load_file_data(directory, i)
    df <- df[complete.cases(df),]
    if(nrow(df) > threshold) {
      #Perform cor calculations
      res_v <- c(res_v, cor(df[,"sulfate"], df[,"nitrate"]))
    }
  }
  return (res_v)
}
```

-   Examples

``` r
cr <- corr("specdata", 150)
head(cr); summary(cr)
```

    ## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313

``` r
cr <- corr("specdata", 400)
head(cr); summary(cr)
```

    ## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313

``` r
cr <- corr("specdata", 5000)
head(cr); summary(cr) ; length(cr)
```

    ## NULL

    ## Length  Class   Mode 
    ##      0   NULL   NULL

    ## [1] 0
