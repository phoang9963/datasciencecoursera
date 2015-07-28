best <- function(state, outcome){
  ##Read outcome data
  hos_data <- read.csv("outcome-of-care-measures.csv")
  ##Extract relevant columns from data and create new data frame
  hos_name <- as.character(hos_data$Hospital.Name)
  hos_state <- as.character(hos_data$State)
  hrt_attk <- c(hos_data[,11])
  hrt_fail <- c(hos_data[,17])
  pneu <- c(hos_data[,23])
  
  new_hos_data <- cbind(hos_name, hos_state, hrt_attk, hrt_fail, pneu)
  
  ##Check that state and outcome are valid
  list_states <- unique(hos_state)
  outcomes = c("heart attack", "heart failure", "pneumonia")
  check_state <- sum(list_states == state)
  check_outcomes <- sum(outcomes == outcome)
      
    if (check_state == 0) { ##Checks state input is valid
      stop("invalid state")
    } else {
        if (check_outcomes == 0) { ##Checks outcome input is valid
          stop("invalid outcome")
        } else {
          hos_data_state <- new_hos_data[new_hos_data[,2] == state,]
            if (outcome == "heart attack") {
              orderdata <- hos_data_state[order(hos_data_state[,3],hos_data_state[,1],na.last = NA),]
              #return(orderdata[1])
              return(head(orderdata))
            } else if (outcome == "heart failure") {
              orderdata <- hos_data_state[order(hos_data_state[,4],hos_data_state[,1],na.last = NA),]
              #return(orderdata[1])
              return(head(orderdata))
            } else {
              orderdata <- hos_data_state[order(hos_data_state[,5],hos_data_state[,1],na.last = NA),]
              #return(orderdata[1])
              return(head(orderdata))
            }
          
        }
    }
  
  
  
 
  ##if (outcome != ho)
  
  ##Return hospital name in that state with lowest 30-day death rate.
}