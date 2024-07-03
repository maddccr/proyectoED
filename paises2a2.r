library(ggplot2)
#comparar la popularidad segun paises
#1)diagrama de dispersion
ggplot(d2) + geom_point(aes(x=country, y=popularity))
#Podemos ver que en Republica Dominicana la popularidad varia mas que en otros paises

#2)diagrama de caja
ggplot(d2) + geom_boxplot(aes(x=country, y=popularity))



#comparo todos los paises con uruguay segun danzabilidad y popularidad
#UY USA
uy_us <- subset(d2, d2$country %in% c("UY", "US"), 
select = c(name, artists, daily_rank, country, snapshot_date, popularity,
           is_explicit, duration_ms, danceability, album_release_date))

ggplot(uy_us) + geom_boxplot(aes(x=country, y=popularity))            
ggplot(uy_us) + geom_boxplot(aes(x=country, y=danceability)) 
ggplot(uy_us) + geom_col(aes(x=country, y=artists , fill=is_explicit), position = "dodge")
#UY RD

uy_do <- subset(d2, d2$country %in% c("UY", "DO"), 
                select = c(name, artists, daily_rank, country, snapshot_date, popularity,
                           is_explicit, duration_ms, danceability, album_release_date))

ggplot(uy_do) + geom_boxplot(aes(x=country, y=popularity))            
ggplot(uy_do) + geom_boxplot(aes(x=country, y=danceability)) 

#UY BR
uy_BR <- subset(d2, d2$country %in% c("UY", "BR"), 
                select = c(name, artists, daily_rank, country, snapshot_date, popularity,
                           is_explicit, duration_ms, danceability, album_release_date))

ggplot(uy_BR) + geom_boxplot(aes(x=country, y=popularity))            
ggplot(uy_BR) + geom_boxplot(aes(x=country, y=danceability)) 


#Veo variabilidad entre todos los paises segun si es explicito o no, y su danzabilidad


ggplot(d3) + geom_boxplot(aes(x=country, y=danceability , fill=is_explicit), position = "dodge") + 
  labs(x="País", y="Danzabilidad", fill="Es explicito")+
  scale_fill_manual(values = c("lightyellow", "lightpink"))


#UY CA
uy_ca <- subset(df, df$country %in% c("UY", "CA"))


ggplot(uy_ca) + geom_boxplot(aes(x=country, y=danceability , fill=is_explicit),
                             position = "dodge")

#UY PA

uy_pa <- subset(df, df$country %in% c("UY", "PA"))


ggplot(uy_pa) + geom_boxplot(aes(x=country, y=danceability , fill=is_explicit),
                             position = "dodge")

#UY ChiLe

uy_CL <- subset(df, df$country %in% c("UY", "CL"))


ggplot(uy_CL) + geom_boxplot(aes(x=country, y=danceability , fill=is_explicit),
                             position = "dodge")


which.max(d2$danceability)
d2$name[409]
#xancion mas bailable de mexico
MX <- subset(df, df$country %in% "MX")
which.max(MX$danceability)
MX$name[41]
#cancion menos bailable
pe <- subset(df, df$country %in% "PE")
which.min(pe$danceability)
pe$name[8534]

ca <- subset(df, df$country %in% "CA")
which.min(ca$danceability)
ca$name[8344]

install.packages("rcartocolor")
library(rcartocolor)
coloressunset <- rcartocolor::carto_pal(2, "Sunset")

ggplot(d3) + geom_boxplot(aes(x=country, y=danceability , fill=is_explicit), position = "dodge") + 
  labs(x="País", y="Danzabilidad", fill="Es explicito") +
  scale_fill_manual(values = coloressunset) + theme_minimal()

ggplot(d3) + geom_boxplot(aes(x=country, y=danceability , fill=is_explicit), position = "dodge") + 
  labs(x="País", y="Danzabilidad", fill="Es explicito") +
  scale_fill_carto_d(palette = "Sunset") + scale_fill_carto_d(palette = "Magenta")



#factor modo
df$modo <- factor(df$mode, labels = c("a", "b"), levels= c(1, 0))
df
library(tidyverse)
 df_oficial %>%  mutate(mode=factor(mode, levels= c("Alegre","Triste")))
 