#tidyverse
# df %>% filter(condicion rows) %>% select(cols.name)

install.packages("tidyverse") 
install.packages("dplyr")

#energia <- subset(db, Anio == 2007, select=c(Sector, Demanda))
#grepl("char", col)  --> buscar las filas que tiene char en la col

db <- read.csv("energia_anual.csv", sep = ";")
colnames(db) <- c("Sector", "Demanda", "Anio")
db |> filter(Anio == 2007) |> select()
db |> filter(grepl("IND", Sector)) |> select(Sector,Demanda, Anio) |> head()

#Ejercicio
install.packages("dslabs")
library(dslabs)
data("murders")
data <- murders

#filtros
no_florida <- data |> filter(state != "Florida")
NYTEX <- data |> filter( state %in% c("New York", "Texas"))
murders_nw <- data |> filter(region %in% c("Northeast", "West")) |> select(!abb) # o -abb

# col = algo | col = otro
#arrange() asc o dec sg los valores de cols
murders_sorted <- arrange(murders, population) #desc() 

#utilizar en el trabajo 
