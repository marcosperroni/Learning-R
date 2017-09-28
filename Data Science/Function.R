# FUNÇÃO 1 
func <- function (x=10){
  x
}

# FUNÇÃO 2 
func2 <- function (x=10){
  x^2
}

#FUNÇÃO 3
func3 <- function (x=10, y=5, z=2){
  (x^2)*(y+z)
}

# FUNÇÃO 4
# CRIAÇÃO DE UMA MATRIZ RANDÔMICA NORMAL
func4 <- function(a=8,b=8, c=a*b){
  matrix(rnorm(c, 0,1), a,b)
}

# FUNÇÃO 5
# CRIAÇÃO DE UMA MATRIZ RANDÔMICA UNIFORME
func5 <- function(a=8,b=8, c=a*b){
  matrix(runif(c, min=0, max=100), a,b)
}

# FUNÇÃO 6
#MATRIZ BINÁRIA TEXTUAL, DISTRIBUIÇÃO UNIFORME
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


# FUNÇÃO 7
#GERAÇÃO DE UMA MATRIZ BINÁRIA (0, 1)
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

