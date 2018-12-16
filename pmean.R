load_file_data <- function(directory, id) {
  read.csv(paste(directory, sprintf("%03d.csv", id), sep="/"))
}

pmean <- function(directory, pollutant, id = 1:332) {
  #Gather requested data to one frame 
  data <- data.frame()
  for(i in id) {
    data <- rbind(data, load_file_data(directory, i))
  }
  #Perform logic
  return(mean(data[,pollutant], na.rm = TRUE))
}

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
