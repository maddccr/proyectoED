
#importar dataset original
df <- read.csv("universal_top_spotify_songs.csv")

#subset de paises y variables
d1 <- subset(df, df$country %in% c("UY", "AR", "BR", "CO", "CL", "PE", "US", "CA", "MX", "PA", "GT", "DO"), 
select = c(name, artists, daily_rank, country, snapshot_date, popularity, is_explicit, duration_ms, danceability, album_release_date)) 

d2 <- subset(df, df$country %in% c("UY", "AR", "BR", "CO", "CL", "PE", "US", "CA", "MX", "PA", "GT", "DO")
             & df$snapshot_date %in% c("2024-06-05", "2023-12-12"),  #fechas en otro formato/ya no funca
      select = c(name, artists, daily_rank, country, snapshot_date, popularity, is_explicit, duration_ms, danceability, album_release_date)) 

#subset incluyendo las fechas (12 de dic 2023 y 5 de junio - modificar luego)
d3 <- subset(df, df$country %in% c("UY", "AR", "BR", "CO", "CL", "PE", "US", "CA", "MX", "PA", "GT", "DO") & df$snapshot_date %in% c("6/5/2024", "12/12/2023"), 
             select = c(name, artists, daily_rank, country, snapshot_date, popularity, is_explicit, duration_ms, danceability, album_release_date)) 

#exportar dataset d3
write.csv(d3, "subdata.csv") #ya esta en la carperta

#falta modificar el id de la observacion!! 
df$X <- 1:1200

#usando tidy
spotidata <- df |> filter( country %in% c()) |> select(name)

#traer el subset
library(dplyr)
library(ggplot2)
spotify <- read.csv("subset_spotify_1.csv")

uruguay <- spotify |>
  filter(country=="UY")

datos_agrupados_artista <- spotify %>%
  group_by(artists)
conteo_artistas <- datos_agrupados_artista %>%
  count(artists, sort = TRUE)

karol_g <- spotify |>
  filter(artists=="KAROL G")

ggplot(data= karol_g) + geom_bar(aes(x=country))

#respuesta numerica y explicativa categorica: relacion entre pais y popularidad
ggplot(data=karol_g) + geom_boxplot(aes(x=country, y=popularity))

#probando :)
taylor <- spotify |>
  filter(artists=="Taylor Swift")
#diez artistas que aparecen más




