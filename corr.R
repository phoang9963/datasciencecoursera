corr <- function(directory, threshold=0) {
  
  
ID_list <- list.files(directory, full.names=TRUE)
  
cor_vector <- c()
  
  
  for (i in 1:length(ID_list)){         
    pol_file <- read.csv(ID_list[i])     
    good_pol <- complete.cases(pol_file)
    sum_nobs <- sum(good_pol) 
    pol_comp <- pol_file[good_pol,]
    correl <- c(cor(pol_comp["nitrate"],pol_comp["sulfate"]))
      if (sum_nobs > threshold) {
      cor_vector <- c(cor_vector,correl)
      tf <- cor_vector !=0
      cor_vector <- cor_vector[tf]
      } else {
      cor_vector <- c(cor_vector,0)  
      }
  }  

cor_vector
  
}