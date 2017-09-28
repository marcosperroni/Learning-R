# IF ELSE 1
x <- runif(1, 0, 10)
if(x < 3) {
  y <- "MENOR QUE TRÊS"
} else {
  y <- "MAIOR OU IGUAL A TRÊS"
}


# IF ELSE 2
x <- runif(1, 0, 15)
if(x < 3) {
  y <- "menor que três"
} else if (x >= 3 & x<=6.99) {
  y <- "entre três e sete"
} else if (x >= 7 & x<=10){
  y <-  "entre sete e dez"
} else{
  y <- "maior que 10"
}

# IF ELSE 3
x <- runif(1, 0, 15)
y <- if(x < 3) {
   "menor que três"
} else if (x >= 3 & x<=6.99) {
   "entre três e sete"
} else if (x >= 7 & x<=10){
    "entre sete e dez"
} else{
   "maior que 10"
}

#LOOP FOR 1
x <- c("a", "b", "c", "d")
   for(i in 1:4) {
       print(x[i])
}

# LOOP FOR 2
x <- runif(10, 0, 10)
for(i in seq_along(x)) {
  x[i] <- if(x[i] > 3) {  "maior"} else {  "menor"}
}

# FUNÇÃO LOOP FOR COM IF
flp <- function(x=10, y=0, z=10){
  x <- runif(x, y, z)
  for(i in seq_along(x)) {
    x[i] <- if(x[i] > (z-y/2)) {  "maior"} else {  "menor"}
  }
  return(x)
}


# PERCORRENDO UMA MATRIZ COM LOOP FOR
# ATRIBUI TESTE LÓGICO (BINÁRIO) A UMA MATRIZ k
ha <- matrix(1:12, 4, 3)
k <-  matrix(nrow=4, ncol=3)
for(i in seq_len(nrow(ha))) {
  for(j in seq_len(ncol(ha))) {
    
     k[i, j] <- if(ha[i, j] >=5) {  "maior"} else {  "menor"}
  }
}

# PERCORRENDO UMA MATRIZ COM LOOP FOR
# ATRIBUI TESTE LÓGICO (MULTINOMIAL) A UMA MATRIZ LO
x <- matrix(1:64, 8, 8)
lo <-  matrix(nrow=8, ncol=8)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    lo[i, j] <- if(x[i, j] <= 15) {
      "pequeno"
      } 
    else if ( x[i, j] < 40){
      "medio"
    }else {
        "grande"
      }
  }
}


# PERCORRENDO UMA MATRIZ COM LOOP FOR
# ATRIBUI TESTE LÓGICO (BINÁRIO) A UMA MATRIZ p
# PROGRAMADO DE FORMA DIFERENTE

mymat = matrix(1:64, 8, 8) 
p <- matrix(nrow=8, ncol=8)
for(i in 1:dim(mymat)[1])  
{
  for(j in 1:dim(mymat)[2]) 
  {
  p[i,j] <- if(mymat[i, j] < 20) {  "menor"} else {  "maior"}   
  }
}

##########################################################33

#LOOP WHILE
x = 2
while(x <= 10) { 
  x = x + 1
  print(c(x)) 
}

