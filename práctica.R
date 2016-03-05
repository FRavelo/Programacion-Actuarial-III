#Estructuras de control
x <- 11
if(x>3){
    y <- 10
} else{
    y <- 5
}
y

x <- 2
y <- if(x>3){
    10
} else{
    5
}

x <- runif(1)
x

x <- runif(1)
if(x<=0.3){
    print("Hola")
} else if(x<=0.5){
    print("qué onda")
} else if(x<=0.7){
    print("quiubo")
} else if(x<=0.9){
    print("qué pex")
} else{
    print("qué pedo wey")
}
x

#Ejemplo For
for(i in c(2,5,9)){
    print(i)
}

x <- matrix(1:6,2,3)
x
for(i in seq_len(nrow(x))){
    for(j in seq_len(ncol(x))){
        print(x[i,j])
    }
}

#Prueba de funcionamiento
n <- 1000
mensajes <- vector("character",n)
for(i in 1:n){
    y <- runif(1)
    if(y<=0.3){
        mensajes[i] <- "mensaje de 30 %"
    } else if(y<=0.5){
        mensajes[i] <- "mensaje de 20 % a"
    } else if(y<=0.7){
        mensajes[i] <- "mensaje de 20 % b"
    } else if(y<=0.9){
        mensajes[i] <- "mensaje de 20 % c"
    } else{
        mensajes[i] <- "mensaje de 10 %"
    }
}

plot(table(mensajes))