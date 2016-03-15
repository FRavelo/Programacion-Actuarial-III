caminata <- function(x,n)
    z <- x
    k <- 1
    v <- vector("numeric", 0)
    for(i in 1:n){
        length(v) <- length(v)+1
        vec[k] <- (z)
        moneda <- rbinom(1,1,0.5)
        if(moneda==1){ 
            z <- z+1
            v[k] <- z
        } else{
            z<-z-1
            v[k] <- z
        }
        k <- k+1
        if(k== 100000) break
    }
    print(v)
    plot(v,type="l",lwd=5)
    