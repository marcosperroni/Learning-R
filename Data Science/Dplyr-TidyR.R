install.packages("readr")
library(readr)
library(dplyr)
library(readxl)

data1 <- read.csv("C:/POS-DOC/CURSO-R/bp.csv", sep = ";",dec="," ,header = TRUE)
energia<- read_excel("C:/POS-DOC/CURSO-R/bp.xlsx", sheet = "energia_primaria")
str(energia)
#energia2 <- read_csv("C:/POS-DOC/CURSO-R/bp.csv")
  
glimpse(energia)

#CRIA UMA TABELA DE FREQUÊNCIA
count(energia, Continente)

#SELECT

select(energia, País, Ano_2008, Ano_2014)

#SELECIONA UM INTERVALO
select(energia, País, Ano_2008:Ano_2014)

#FILTRO
filter(energia, Ano_2015 > 200)
df1 <- select(energia, País, Ano_2014:Ano_2015)
filter(df1, Ano_2015 > 200)
filter(energia, Ano_2015 > 200, Continente == "Europa")
filter(energia, Continente %in% c("Africa", "Asia"))
#FUNÇÃO SELETC E FILTER ANINHADAS
select(filter(energia, Continente %in% c("Africa", "Asia")),Continente, País, Ano_2015)


#FUNÇÃO ARRANGE - UTILIZAÇÃO DO OPERADOR %>%
energia %>% arrange(Ano_2015)

#SELEÇÃO, ARRANJO E FILTRO
energia %>% select(País, Ano_2014:Ano_2015) %>% 
  arrange(desc(Ano_2015))%>%
  filter(Ano_2015 > 200)

#SELEÇÃO, ARRANJO E FILTRO DUPLO
energia %>% select(Continente, País, Ano_2014:Ano_2015) %>% 
  arrange(desc(Ano_2015))%>%
  filter(Ano_2015 > 200, Continente %in% c("Africa", "Asia"))

#CRIA UMA NOVA COLUNA - FUNÇÃO MUTATE
#CRIA UMA COLUNA E_SOMA - SOMA A ENRGIA DE TODOS OS ANOS
 energia %>% 
  mutate(e_SOMA=apply(energia[,3:53],1, sum))%>% head()


tt <-  energia %>% 
   mutate(e_SOMA=apply(energia[,3:53],1, sum), e_média =e_SOMA/51 )%>% head()

#RESUME AS COLUNAS POR UMA FORMULA
#CALCULA O DESVIO PADRÃO
energia %>% 
  summarize (desvio =sd(Ano_2015))

#CALCULA O DESVIO PADRÃO E A MÉDIA
energia %>% 
  summarize (desvio =sd(Ano_2015), média=mean(Ano_2014), observações=n())

# CALCULA MÉDIA E DESVIO PADRÃO
sm <- energia %>% 
  summarize (desvio_2014 =sd(Ano_2014), média_2014=mean(Ano_2014),desvio_2015 =sd(Ano_2015), média_2015=mean(Ano_2015))
# PASSA O RESULTADO PARA UMA MATRIZ
matrix(sm, 2,2)

# GROUP_BY

energia %>%
  group_by (Continente) %>%
summarize (média =mean(Ano_2015)) %>% arrange(desc(média))


#PACOTE TIDYR - REMODELAGEM DE DADOS
install.packages("tidyr")
library(tidyr)

#FUNÇÃO GATHER - REMODELAGEM
#COLOCA OS DADOS DE ENERGIA EM UMA ÚNICA COLUNA
E_Reshape <- energia %>%
  gather (Ano, Energia, Ano_1965:Ano_2015)

# SEPARA
E_Reshape2 <- E_Reshape %>% separate(Ano, into = c("Ano", "Ano_num"), sep="\\_")

# AGRUPA ANO
E_Reshape2 %>%
  group_by (Ano_num) %>% 
  summarize (média =mean(Energia))

#FUNÇÃO SPREAD

# VOLTA OS DADOS NO FORMATO ORIGINAL
E_Reshape %>% 
  spread(Ano, Energia)

#FUNÇÃO UNITED
E_Reshape2 %>% unite (união, Ano, Ano_num, sep="/")

############################################################33
#RESHAPE - BASE
# REMODELANDO DADOS COM O BASE
energia_df <- as.data.frame(energia)
energia_mod <- reshape(energia_df,
                       varying = 3:53,
                       v.names = "Energia",
                       timevar="Anos",
                       times = names(energia_df)[3:53],
                       idvar = "Identificação",
                       direction = "long")


energia_df2 <- energia_df[,c(1:2, 46:53)]
energia_mod2 <- reshape(energia_df2,
                       varying = list (c(3:6), c(7:10)),
                       v.names = c("Período 1", "Período 2"),
                       timevar="Anos",
                       times = c("2008-2012", "2009-2013", "2010-2014", "2011-2015"),
                       idvar = "Identificação",
                       direction = "long")

# RESHAPE2
library(reshape2)

#FUNÇÃO MELT - DERRETENDO O DATA-FRAME

E_melt <- melt(energia, id=(c("Continente", "País")), value.name = "Energia", variable.name = "Anos")

#FUNÇÃO DCAST
#ESTICANDO O DATA FRAME

dcast(E_melt, formula = País + Continente ~ Anos, value.var="Energia" )

dcast(E_melt, formula = País  ~ Anos, value.var="Energia" )

#PACOTE PLYR - 
library(plyr)
# MODIFICA O BANCO APLICA UMA FUNÇÃO E RETORNA O RESULTADO
#APLICANDO A FUNÇÃO SUMMARIZE
ddply(energia, .(Continente),
      summarize, Média_Cont=mean(Ano_2015))

#MAIS DE UMA FUNÇÃO PODE SR UTILIZADA
ddply(energia,.(Continente),
      summarize,
      Soma = sum(Ano_2015),
      Média_Cont=mean(Ano_2015),
      std = sd(Ano_2015))


#PASSANDO MAIS DE UM FATOR.
ddply(energia,.(Continente, País),
      summarize,
      Soma = sum(Ano_2015),
      Média_Cont=mean(Ano_2015),
      std = sd(Ano_2015))

#COLOCA A MÉDIA PARA CADA CONTINENTE, REPETINDO A INFORMAÇÃO.
ddply(energia, .(Continente),
      transform, Média_Cont=mean(Ano_2015))



