#PLOTS 

library(ggplot2)
library(tidyverse)
library(sf)


#Funcion 
corr <- function(x, y) {
  xcov <- x - mean(x)
  ycov <- y - mean(y)
  cov <- sum(xcov*ycov)/(length(x) - 1)
  corr <- cov/(sd(x)*sd(y))
} # usar co()
#-0.009364059 --> no hay relacion entre pop y dan
#-0.1729306 energy y pop // 0.0341512 dan y ene 
#-0.5578563 pop y loud //  0.1939813 dan y loud !!!!
x <- corr(data_2$danceability, data_2$loudness)

#Intentos de correlacion 
data |> ggplot(aes(x = loudness, y= popularity)) + 
  geom_jitter(aes(color = country)) +
  geom_smooth( method = "lm", se=FALSE) +
  theme_bw() #PROBAR SOLO CL, CO, DO -- BR

data_2 |> filter(country == "BR") |> 
          ggplot(aes(x = loudness, y= popularity)) +  

#vars danceability y loudness
data_2 |> ggplot(aes(x = loudness, y= danceability, color = country)) + 
  geom_jitter(aes(color = country)) +
  geom_smooth( method = "lm", se=FALSE) +
  theme_bw() 

#danceability by country // MEJOR SEGUN ANGLOSAJON VS LATAM 
data |> ggplot() + geom_boxplot(aes(y = danceability, x= country))


#MAPS  // otras libraries maps, rnaturalearth 

map <- read_sf("map.geojson") #eliminar groenlandia!
map <- map |> rename(postal = iso_3166_1_alpha_2_codes)

mean_dance <- data_1 |> 
  group_by(country) |> 
  summarise(mean = weighted.mean(danceability, popularity), meanog = mean(danceability))

map_mean <- merge(map, mean_dance, by.x = "postal", by.y = "country", all.x = TRUE)
map_mean <- map_mean |> filter(postal != "GL")


ggplot(map_mean) + geom_sf(aes(fill = mean), color = "black") +
  coord_sf(xlim = c(-185, -10), ylim = c(-60, 90), expand = FALSE) +
  labs(title = "Danceability Promedio", fill = "") +
  theme_minimal() + # o al final
  theme(
    axis.text = element_blank(),  # Remove axis text
    axis.ticks = element_blank(),  # Remove axis ticks
    axis.title = element_blank(),  # Remove axis titles
  ) #CHANGE THEME / LEGEND 

#scale_fill_viridis_c na.value = "grey80"
#scale_fill_gradient(low = "purple", high = "orange") +
#scale_fill_viridis_c(option = "C", na.value = "grey80", guide = guide_colorbar(direction = "vertical", barheight = unit(0.8, "npc"))) +  # Vertical legend
#scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0.5, na.value = "grey80")

#otro forma:
ggplot(data = americas_data) +
  geom_sf(aes(fill = mean_danceability.mean_danceability)) +
  scale_fill_viridis_c(option = "C", na.value = "grey80") +  # Use a color scale, grey for NA values
  theme_minimal() +
  labs(title = "Mean Danceability by Country in the Americas", fill = "Danceability") +
  theme(legend.position = "bottom")


#PONER UN SUPER GRAFICO 







