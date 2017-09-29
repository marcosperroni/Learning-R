

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

#COM A FUNÇÃO SAPPLY QUE APLICA UMA FUNÇÃO A UMA LISTA
#MÉDIA
sapply(lista1, sum)
#DESVIO PADRÃO
sapply(lista1, sd)

#FUNÇÃO APPLY - APLICA UMA FUNÇÃO NAS LINHAS E COLUNAS DA MATRIZ/DATA FRAME
#OBTEM O RESULTADO DAS MARGENS DA MATRIZ
z <- matrix(runif(12, 0,1) ,3,4)

#SOMA AS LINHAS DA MATRIZ
apply(z, 1, sum)
#SOMA AS COLUNAS DA MATRIZ
apply(z, 2, sum)

# DATA FRAME - POPULAÇÃO EM MILHÔES
pop <- data.frame(país =c("Brazil", "Argentina","uruguai", "Peru", "Colombia")
, crianças = c(40, 50, 45, 41, 39), adultos=c(50, 40, 30, 20, 10), idosos=c(10, 15, 20, 13, 23))

# USANDO A FUNÇÃO APPLY EM DATA FRAMES
pop$Média <- apply(pop[,c(2,3,4)], 1, mean)                       
pop$Soma <- apply(pop[,c(2,3,4)], 1, sum)                      


pop2 <- data.frame(país =c("Brazil", "Argentina","uruguai", "Peru", "Colombia", "Brazil", "Peru")
                  , crianças = c(40, 50, 45, 41, 39, 10, 10), adultos=c(50, 40, 30, 20, 10, 10, 10), idosos=c(10, 15, 20, 13, 23, 10, 10))

#USANDO A FUNÇÃO TAPPLY [SOMA LINHAS]
tapply(c( pop2$adultos), pop2$país,sum )

#MAPPLY, [SOMA COLUNAS]
mapply(sum, pop2$adultos, pop2$idosos)



#FUNÇÃO LAPPLY [RETORNA UMA LISTA]
lista2 <- list (x=(1:20), y=(50:100))
lapply(lista2, sum)

rapply(lista2, sum, how = "list")

#FUNÇÃO SPLIT
#DIVIDE O DATAFRAME - CRIA UMA LISTA PARA CADA PAÍS
ds <- split(pop2, pop2$país)

# A FUNÇÃO DO.CALL APLICADA UMA FUNÇÃO AO OBJETO INTEIRO
#A APLICAÇÃO DA FUNÇÃO RBIND RETORNA O DATA FRAME.
df <- do.call(rbind, ds)




