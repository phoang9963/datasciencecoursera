pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ID_list <- list.files(directory, full.names=TRUE)
  
  pol_file <- data.frame()
  
  for (i in id){                          
    pol_file <- rbind(pol_file, read.csv(ID_list[i]))
  }
  if (pollutant == "sulfate") {
    pol_mean <- mean(pol_file[,"sulfate"],na.rm=TRUE)
  } else if (pollutant == "nitrate") {
    pol_mean <- mean(pol_file[,"nitrate"],na.rm=TRUE)
  } else {
    pol_mean <- c("Pollutant non-existent")
  }
  
  print(pol_mean)
}
