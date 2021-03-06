# FUN플O 1 
func <- function (x=10){
  x
}

# FUN플O 2 
func2 <- function (x=10){
  x^2
}

#FUN플O 3
func3 <- function (x=10, y=5, z=2){
  (x^2)*(y+z)
}

# FUN플O 4
# CRIA플O DE UMA MATRIZ RAND�MICA NORMAL
func4 <- function(a=8,b=8, c=a*b){
  matrix(rnorm(c, 0,1), a,b)
}

# FUN플O 5
# CRIA플O DE UMA MATRIZ RAND�MICA UNIFORME
func5 <- function(a=8,b=8, c=a*b){
  matrix(runif(c, min=0, max=100), a,b)
}

# FUN플O 6
#MATRIZ BIN핾IA TEXTUAL, DISTRIBUI플O UNIFORME
func6 <- function(a=8,b=8, c=a*b){
  mymat <- matrix(runif(c, min=0, max=100), a,b)
     p <- matrix(nrow=a, ncol=b)
   for(i in 1:dim(mymat)[1])  
   {
     for(j in 1:dim(mymat)[2]) 
     {
       p[i,j] <- if(mymat[i, j] < 50) {  "abaixo"} else {  "acima"}   
     }
     
   }
     return(p)
}


# FUN플O 7
#GERA플O DE UMA MATRIZ BIN핾IA (0, 1)
func7 <- function(a=8,b=8, c=a*b){
  mymat <- matrix(runif(c, min=0, max=100), a,b)
  p <- matrix(nrow=a, ncol=b)
  for(i in 1:dim(mymat)[1])  
  {
    for(j in 1:dim(mymat)[2]) 
    {
      p[i,j] <- if(mymat[i, j] < 50) {0} else { 1}   
    }
    
  }
  return(p)
}

