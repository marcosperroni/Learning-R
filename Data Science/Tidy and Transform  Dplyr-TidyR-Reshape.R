install.packages("readr")
library(readr)
library(dplyr)
library(readxl)

data1 <- read.csv("C:/POS-DOC/CURSO-R/bp.csv", sep = ";",dec="," ,header = TRUE)
energia<- read_excel("C:/POS-DOC/CURSO-R/bp.xlsx", sheet = "energia_primaria")
str(energia)
energia <- read_delim("C:/POS-DOC/CURSO-R/bp.csv", delim = ";", locale = locale(encoding = "Latin1", grouping_mark = "."))
energia4 <- read_csv2("C:/POS-DOC/CURSO-R/bp.csv", locale = locale(encoding = "Latin1", grouping_mark = "."))
tv2 <- read_delim("https://raw.githubusercontent.com/marcosperroni/Learning-R/master/Data%20Science/bp.csv", delim = ";", locale = locale(encoding = "Latin1", grouping_mark = "."))

glimpse(energia)

#CRIA UMA TABELA DE FREQU�NCIA
count(energia, Continente)

#SELECT

select(energia, Pa�s, Ano_2008, Ano_2014)

#SELECIONA UM INTERVALO
select(energia, Pa�s, Ano_2008:Ano_2014)

#FILTRO
filter(energia, Ano_2015 > 200)
df1 <- select(energia, Pa�s, Ano_2014:Ano_2015)
filter(df1, Ano_2015 > 200)
filter(energia, Ano_2015 > 200, Continente == "Europa")
filter(energia, Continente %in% c("Africa", "Asia"))
#FUN��O SELETC E FILTER ANINHADAS
select(filter(energia, Continente %in% c("Africa", "Asia")),Continente, Pa�s, Ano_2015)


#FUN��O ARRANGE - UTILIZA��O DO OPERADOR %>%
energia %>% arrange(Ano_2015)

#SELE��O, ARRANJO E FILTRO
energia %>% select(Pa�s, Ano_2014:Ano_2015) %>% 
  arrange(desc(Ano_2015))%>%
  filter(Ano_2015 > 200)

#SELE��O, ARRANJO E FILTRO DUPLO
energia %>% select(Continente, Pa�s, Ano_2014:Ano_2015) %>% 
  arrange(desc(Ano_2015))%>%
  filter(Ano_2015 > 200, Continente %in% c("Africa", "Asia"))

#CRIA UMA NOVA COLUNA - FUN��O MUTATE
#CRIA UMA COLUNA E_SOMA - SOMA A ENRGIA DE TODOS OS ANOS
 energia %>% 
  mutate(e_SOMA=apply(energia[,3:53],1, sum))%>% head()


tt <-  energia %>% 
   mutate(e_SOMA=apply(energia[,3:53],1, sum), e_m�dia =e_SOMA/51 )%>% head()

#RESUME AS COLUNAS POR UMA FORMULA
#CALCULA O DESVIO PADR�O
energia %>% 
  summarize (desvio =sd(Ano_2015))

#CALCULA O DESVIO PADR�O E A M�DIA
energia %>% 
  summarize (desvio =sd(Ano_2015), m�dia=mean(Ano_2014), observa��es=n())

# CALCULA M�DIA E DESVIO PADR�O
sm <- energia %>% 
  summarize (desvio_2014 =sd(Ano_2014), m�dia_2014=mean(Ano_2014),desvio_2015 =sd(Ano_2015), m�dia_2015=mean(Ano_2015))
# PASSA O RESULTADO PARA UMA MATRIZ
matrix(sm, 2,2)

# GROUP_BY

energia %>%
  group_by (Continente) %>%
summarize (m�dia =mean(Ano_2015)) %>% arrange(desc(m�dia))


#PACOTE TIDYR - REMODELAGEM DE DADOS
install.packages("tidyr")
library(tidyr)

#FUN��O GATHER - REMODELAGEM
#COLOCA OS DADOS DE ENERGIA EM UMA �NICA COLUNA
E_Reshape <- energia %>%
  gather (Ano, Energia, Ano_1965:Ano_2015)

# EM OUTRA FORMA
E_Reshape_Teste <- energia %>%
  gather (Ano_1965:Ano_2015, key="Ano", value="Energia")

# SEPARA
E_Reshape2 <- E_Reshape %>% separate(Ano, into = c("Ano", "Ano_num"), sep="\\_")

# AGRUPA ANO
E_Reshape2 %>%
  group_by (Ano_num) %>% 
  summarize (m�dia =mean(Energia))

#FUN��O SPREAD

# VOLTA OS DADOS NO FORMATO ORIGINAL
E_Reshape %>% 
  spread(Ano, Energia)

#FUN��O UNITED
E_Reshape2 %>% unite (uni�o, Ano, Ano_num, sep="/")

############################################################33
#RESHAPE - BASE
# REMODELANDO DADOS COM O BASE
energia_df <- as.data.frame(energia)
energia_mod <- reshape(energia_df,
                       varying = 3:53,
                       v.names = "Energia",
                       timevar="Anos",
                       times = names(energia_df)[3:53],
                       idvar = "Identifica��o",
                       direction = "long")


energia_df2 <- energia_df[,c(1:2, 46:53)]
energia_mod2 <- reshape(energia_df2,
                       varying = list (c(3:6), c(7:10)),
                       v.names = c("Per�odo 1", "Per�odo 2"),
                       timevar="Anos",
                       times = c("2008-2012", "2009-2013", "2010-2014", "2011-2015"),
                       idvar = "Identifica��o",
                       direction = "long")

# RESHAPE2
library(reshape2)

#FUN��O MELT - DERRETENDO O DATA-FRAME

E_melt <- melt(energia, id=(c("Continente", "Pa�s")), value.name = "Energia", variable.name = "Anos")

#FUN��O DCAST
#ESTICANDO O DATA FRAME

dcast(E_melt, formula = Pa�s + Continente ~ Anos, value.var="Energia" )

dcast(E_melt, formula = Pa�s  ~ Anos, value.var="Energia" )

#PACOTE PLYR - 
library(plyr)
# MODIFICA O BANCO APLICA UMA FUN��O E RETORNA O RESULTADO
#APLICANDO A FUN��O SUMMARIZE
ddply(energia, .(Continente),
      summarize, M�dia_Cont=mean(Ano_2015))

#MAIS DE UMA FUN��O PODE SR UTILIZADA
ddply(energia,.(Continente),
      summarize,
      Soma = sum(Ano_2015),
      M�dia_Cont=mean(Ano_2015),
      std = sd(Ano_2015))


#PASSANDO MAIS DE UM FATOR.
ddply(energia,.(Continente, Pa�s),
      summarize,
      Soma = sum(Ano_2015),
      M�dia_Cont=mean(Ano_2015),
      std = sd(Ano_2015))

#COLOCA A M�DIA PARA CADA CONTINENTE, REPETINDO A INFORMA��O.
ddply(energia, .(Continente),
      transform, M�dia_Cont=mean(Ano_2015))



