Lab1
================

Task 1
------

#### Створити змінні базових (atomic) типів. Базові типи: character, numeric, integer, complex, logical.

-   character

``` r
ch <- "char"
ch
```

    ## [1] "char"

``` r
class(ch)
```

    ## [1] "character"

-   numeric

``` r
n <- 1.1
n
```

    ## [1] 1.1

``` r
class(n)
```

    ## [1] "numeric"

-   integer

``` r
i <- 1L
i
```

    ## [1] 1

``` r
class(i)
```

    ## [1] "integer"

-   complex

``` r
c <- 1+2i
c
```

    ## [1] 1+2i

``` r
class(c)
```

    ## [1] "complex"

-   logical

``` r
l <- TRUE
l
```

    ## [1] TRUE

``` r
class(l)
```

    ## [1] "logical"

Task 2
------

#### Створити вектори, які:

-   містить послідовність з 5 до 75:

``` r
v1 <- c(5:75)
v1
```

    ##  [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
    ## [24] 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
    ## [47] 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73
    ## [70] 74 75

-   містить числа 3.14, 2.71, 0, 13:

``` r
v2 <- c(3.14, 2.71, 0.13)
v2
```

    ## [1] 3.14 2.71 0.13

-   100 значень TRUE:

``` r
v3 <- rep(TRUE, 100)
v3
```

    ##   [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    ##  [15] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    ##  [29] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    ##  [43] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    ##  [57] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    ##  [71] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    ##  [85] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    ##  [99] TRUE TRUE

Task 3
------

#### Створити наступну матрицю:

-   за допомогою matrix:

``` r
m1 <- matrix(c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1), nrow = 4, ncol = 3)
m1
```

    ##      [,1]  [,2] [,3]
    ## [1,]  0.5   1.3  3.5
    ## [2,]  3.9 131.0  2.8
    ## [3,]  0.0   2.2  4.6
    ## [4,]  2.0   7.0  5.1

-   за допомогою cbind:

``` r
m2 <- cbind(c(0.5, 3.9, 0, 2), c(1.3, 131, 2.2, 7), c(3.5, 2.8, 4.6, 5.1))
m2
```

    ##      [,1]  [,2] [,3]
    ## [1,]  0.5   1.3  3.5
    ## [2,]  3.9 131.0  2.8
    ## [3,]  0.0   2.2  4.6
    ## [4,]  2.0   7.0  5.1

-   за допомогою rbind

``` r
m3 <- rbind(c(0.5, 1.3, 3.5), c(3.9, 131,2.8), c(0, 2.2,4.6), c(2,7,5.1))
m3
```

    ##      [,1]  [,2] [,3]
    ## [1,]  0.5   1.3  3.5
    ## [2,]  3.9 131.0  2.8
    ## [3,]  0.0   2.2  4.6
    ## [4,]  2.0   7.0  5.1

Task 4
------

#### Створити довільний список (list), в який включити всі базові типи.

``` r
list <- list(ch, n, i, c, l)
list
```

    ## [[1]]
    ## [1] "char"
    ## 
    ## [[2]]
    ## [1] 1.1
    ## 
    ## [[3]]
    ## [1] 1
    ## 
    ## [[4]]
    ## [1] 1+2i
    ## 
    ## [[5]]
    ## [1] TRUE

Task 5
------

#### Створити фактор з трьома рівнями «baby», «child», «adult».

``` r
factor <- factor(c("baby","child","adult"))
factor
```

    ## [1] baby  child adult
    ## Levels: adult baby child

Task 6
------

#### У векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11

-   Знайти індекс першого значення NA:

``` r
v4 <- c(1:4, NA, 6, 7, NA, 9, NA, 11)
match(NA, v4)
```

    ## [1] 5

-   Знайти кількість значень NA:

``` r
sum(is.na(v4))
```

    ## [1] 3

Task 7
------

#### Створити довільний data frame та вивести в консоль

``` r
df <- data.frame(col1 = c(T,F,T,F), col2 = 1:4)
df
```

    ##    col1 col2
    ## 1  TRUE    1
    ## 2 FALSE    2
    ## 3  TRUE    3
    ## 4 FALSE    4

Task 8
------

#### Змінити імена стовпців цього data frame.

``` r
names(df) <- c("new1", "new2")
df
```

    ##    new1 new2
    ## 1  TRUE    1
    ## 2 FALSE    2
    ## 3  TRUE    3
    ## 4 FALSE    4
