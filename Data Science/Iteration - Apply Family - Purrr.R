

# EXEMPLO COM LOOP
lista1 <- list (x=(1:20), y=(50:100))

#SOMA DOS ELEMENTOS COM LOOP
inicial_x =0
inicial_y=0
for (i in lista1$x){
  inicial_x = inicial_x + i
}

for (j in lista1$y){
  inicial_y = inicial_y + j
}
print(inicial_x)  
print(inicial_y)  

#COM A FUN��O SAPPLY QUE APLICA UMA FUN��O A UMA LISTA
#M�DIA
sapply(lista1, sum)
#DESVIO PADR�O
sapply(lista1, sd)

#FUN��O APPLY - APLICA UMA FUN��O NAS LINHAS E COLUNAS DA MATRIZ/DATA FRAME
#OBTEM O RESULTADO DAS MARGENS DA MATRIZ
z <- matrix(runif(12, 0,1) ,3,4)

#SOMA AS LINHAS DA MATRIZ
apply(z, 1, sum)
#SOMA AS COLUNAS DA MATRIZ
apply(z, 2, sum)

# DATA FRAME - POPULA��O EM MILH�ES
pop <- data.frame(pa�s =c("Brazil", "Argentina","uruguai", "Peru", "Colombia")
, crian�as = c(40, 50, 45, 41, 39), adultos=c(50, 40, 30, 20, 10), idosos=c(10, 15, 20, 13, 23))

# USANDO A FUN��O APPLY EM DATA FRAMES
pop$M�dia <- apply(pop[,c(2,3,4)], 1, mean)                       
pop$Soma <- apply(pop[,c(2,3,4)], 1, sum)                      


pop2 <- data.frame(pa�s =c("Brazil", "Argentina","uruguai", "Peru", "Colombia", "Brazil", "Peru")
                  , crian�as = c(40, 50, 45, 41, 39, 10, 10), adultos=c(50, 40, 30, 20, 10, 10, 10), idosos=c(10, 15, 20, 13, 23, 10, 10))

#USANDO A FUN��O TAPPLY [SOMA LINHAS]
tapply(c( pop2$adultos), pop2$pa�s,sum )

#MAPPLY, [SOMA COLUNAS]
mapply(sum, pop2$adultos, pop2$idosos)



#FUN��O LAPPLY [RETORNA UMA LISTA]
lista2 <- list (x=(1:20), y=(50:100))
lapply(lista2, sum)

rapply(lista2, sum, how = "list")

#FUN��O SPLIT
#DIVIDE O DATAFRAME - CRIA UMA LISTA PARA CADA PA�S
ds <- split(pop2, pop2$pa�s)

# A FUN��O DO.CALL APLICADA UMA FUN��O AO OBJETO INTEIRO
#A APLICA��O DA FUN��O RBIND RETORNA O DATA FRAME.
df <- do.call(rbind, ds)

library(tidyverse)
#PACOTE PURRR
df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
#MEDIANA
median(df$a)
#> [1] -0.246
median(df$b)
#> [1] -0.287
median(df$c)
#> [1] -0.0567
median(df$d)
#> [1] 0.144

#OBTENDO A MEDIANA POR MEIO DE UM LOOP
output <- vector("double", ncol(df))
for (i in seq_along(df)) 
  output[[i]] <- median(df[[i]]) 

output


#UTIIZA��O DO PACOTE purrr
# OBTENDO 
#RETORNA A MEDIANA  NO FORMATO DOUBLE - map_dbl 
map_dbl(df, median)
#RETORNA A MEDIANA NO FORMATO

df2 <- tibble(
  a = runif(10, 10,100),
  b = runif(10, 10,100),
  c = runif(10, 10,100),
  d = runif(10, 10,100)
)
#CRIA UMA LISTA 
map(df2, median)

#CRIA UM VETOR
map_dbl(df2, (median))

#USANDO INTEIRO
z <- list(x = 1:3, y = 4:5)

map_int(z, length)

#APLICA UM MODELO A TODAS AS DIVIS�ES DE UM DATA FRAME
models <- mtcars %>%
  split(.$cyl) %>%
  map(function(df) lm(mpg ~ wt, data = df))

#FAZ A MESMA COISA UTILIZANDO UMA FUN��O ANONIMA
models <- mtcars %>%
  split(.$cyl) %>%
  map(~lm(mpg ~ wt, data = .))

#SUM�RIO DOS MODELOS
models %>%
  map(summary)





