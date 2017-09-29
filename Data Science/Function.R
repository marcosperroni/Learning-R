# FUN��O 1 
func <- function (x=10){
  x
}

# FUN��O 2 
func2 <- function (x=10){
  x^2
}

#FUN��O 3
func3 <- function (x=10, y=5, z=2){
  (x^2)*(y+z)
}

# FUN��O 4
# CRIA��O DE UMA MATRIZ RAND�MICA NORMAL
func4 <- function(a=8,b=8, c=a*b){
  matrix(rnorm(c, 0,1), a,b)
}

# FUN��O 5
# CRIA��O DE UMA MATRIZ RAND�MICA UNIFORME
func5 <- function(a=8,b=8, c=a*b){
  matrix(runif(c, min=0, max=100), a,b)
}

# FUN��O 6
#MATRIZ BIN�RIA TEXTUAL, DISTRIBUI��O UNIFORME
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


# FUN��O 7
#GERA��O DE UMA MATRIZ BIN�RIA (0, 1)
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
