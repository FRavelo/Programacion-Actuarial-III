rankhospital <- function(estado, resultado, num) {
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    a <- vector("numeric")
    b <- vector("numeric")
    n <- nrow(outcome)
    
    if (resultado == "ataque") {
        k <- 11
    } else if (resultado == "falla") {
        k <- 17
    } else if (resultado == "neumonía") {
        k <- 23
    } else {
    
    if (k>=11){
        for (i in 1:n) {
            if (outcome[i,7] == estado) {
                a1 <- length(a) + 1
                length(a) <- a1
                length(b) <- a1
                a[a1] <- outcome[i,2]
                b[a1] <- outcome[i,k]
            }
        }
}
