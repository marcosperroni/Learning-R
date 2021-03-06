
library(tidyverse)

#ENTENDENDO OS JOINS

#INNER JOIN
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)

y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)
#INNER JOIN
#S� S�O INCLU�DAS AS COLUNAS IGUAIS EM AMBAS AS TABELAS
x %>%
  inner_join(y, by = "key")

#OUTER JOIN
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  1, "x4"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2"
)


#LEFT JOIN - MAT�M A TABELA X
left_join(x, y, by = "key")
#RIGHT JOIN - MAT�M A TABELA Y
right_join(x, y, by = "key")
#FULL JOIN - MAT�M AS DUS TABELAS
full_join(x, y, by = "key")

######################################33

library(nycflights13)

airlines
airports
planes
weather
flights

#CRIA UMA  NOVO DATA FRAME
flights2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2

#INNER JOIN - N�O MANTEM NEMHUMA DAS DUAS TABELAS
flights2 %>%
  inner_join(planes, by = "tailnum")

#
#INNER JOIN - MANT�M flights2
flights2 %>%
  left_join(planes, by = "tailnum")


# N�O � ESPECIFICADO A COLUNA PARA O JOIN
flights2 %>%
  left_join(weather)

#ESPECIFICA UMA COLUNA PARA O JOIN

flights2 %>%
  left_join(planes, by = "tailnum")

# A ORIGEM DOS VOOS � IGUAL A FAA NOS AEROPORTOS
flights2 %>%
  left_join(airports, c("origin" = "faa"))

# N�O SELECIONA NEM ORIGEM E NEM DESTINO
flights2 %>%
  select(-dest, -origin) %>%
  right_join(planes, by = "tailnum")

#FILTRANDO JOINS
#DEZ DESTINO MAIS POPULARES
top_dest <- flights %>%
  count(dest, sort = TRUE) %>%
  head(10)

#VOOS QUE FORAM PARA OS DESTINOS
flights %>%
  filter(dest %in% top_dest$dest)

# UTILIZA��O DO SEMI JOIN PARA FITRAR
flights %>%
  semi_join(top_dest, by="dest")

#VOOS QUE N�O TEM CONEX�O COM AVI�ES USANDO 
flights %>%
  anti_join(planes, by = "tailnum") %>%
  count(tailnum, sort = TRUE)




