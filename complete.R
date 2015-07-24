complete <- function(directory, id = 1:332) {
  
  ID_list <- list.files(directory, full.names=TRUE)
  
  
  nobs_file <- data.frame()
  
  for (i in id) {
    pol_file <- read.csv(ID_list[i])
    good_pol <- complete.cases(pol_file)
    sum_nobs <- sum(good_pol)
    nobs_file <- rbind(nobs_file,data.frame("id"=i,"nobs"=sum_nobs))
  }
  
  nobs_file
  
}
