Lab3
================

Task 1
------

#### Функція add2(x, y), яка повертає суму двох чисел.

``` r
add2 <- function(a1, a2) {
  return (a1 + a2);
}

add2(3,5)
```

    ## [1] 8

Task 2
------

#### Функція above(x, n), яка приймає вектор та число n, та повертає всі елементі вектору, які більше n. По замовчуванню n = 10.

``` r
above <- function(x, n = 10) {
  return (x[x>n])
}

above(c(1:10), 5)
```

    ## [1]  6  7  8  9 10

Task 3
------

#### Функція my\_ifelse(x, exp, n), яка приймає вектор x, порівнює всі його елементи за допомогою exp з n, та повертає елементи вектору, які відповідають умові expression. Наприклад, my\_ifelse(x, “&gt;”, 0) повертає всі елементи x, які більші 0. Exp може дорівнювати “&lt;”, “&gt;”, “&lt;=”, “&gt;=”, “==”. Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.

``` r
my_ifelse <- function(x, exp, n) {
  if(exp == "<") {
    return (x[x<n])
  } else if (exp == ">") {
    return(x[x>n])
  } else if (exp == "<=") {
    return(x[x<=n])
  } else if (exp == ">=") {
    return(x[x>=n])
  } else if (exp == "==") {
    return(x[x==n])
  } else {
    return (x)
  }
}

my_ifelse(c(1:10), ">=", 5)
```

    ## [1]  5  6  7  8  9 10

Task 4
------

#### Функція columnmean(x, removeNA), яка розраховує середнє значення (mean) по кожному стовпцю матриці, або data frame. Логічний параметр removeNA вказує, чи видаляти NA значення. По замовчуванню він дорівнює TRUE.

``` r
columnmean <- function(x, removeNA = TRUE) {
  return (colMeans(x, na.rm = removeNA))
}

m <- matrix(c(1:4, NA, 6), nrow = 2, ncol = 3)
m
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    3   NA
    ## [2,]    2    4    6

-   test FALSE:

``` r
columnmean(m, FALSE)
```

    ## [1] 1.5 3.5  NA

-   test TRUE:

``` r
columnmean(m, TRUE)
```

    ## [1] 1.5 3.5 6.0
