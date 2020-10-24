library(dplyr)
library(lubridate)
library(tidyverse)
library(reshape2)
library(rapportools)
library(ggplot2)
library(DescTools)



data <- read.csv(file = "D:/Documents/Semestres UFM/2020/Segundo semestre/Data-Product/Parcial2/data/steam.csv", header = TRUE)
description_data <- read.csv(file = "D:/Documents/Semestres UFM/2020/Segundo semestre/Data-Product/Parcial2/data/steam_description_data.csv", header = TRUE)
media_data <- read.csv(file = "D:/Documents/Semestres UFM/2020/Segundo semestre/Data-Product/Parcial2/data/steam_media_data.csv", header = TRUE)

# Data cleanning
names(description_data)[names(description_data) == "steam_appid"] <- "appid"
a <- inner_join(data, description_data, by ='appid')
names(media_data)[names(media_data) == "steam_appid"] <- "appid"
df <- inner_join(a, media_data, by ='appid')

df$release_date <- parse_date_time(df$release_date,orders="ymd")
df$owners <- str_remove(df$owners, "[0-9]*\\-")
df["owners"] <- lapply(df["owners"], function(x) as.numeric(x))


# Cantidad de juegos
length(unique(df$appid))

unique(df$required_age)


# Con la columna release_date un input de barra para que aparesca la data por año
# Grafica cantidad de juegos por año

year_df <- df %>% 
  group_by(year(release_date))

names(year_df)[names(year_df) == "year(release_date)"] <- "Year"

# table by year
summ_year <- year_df  %>% summarise(
  cantidad_juegos = length(appid),
  precio_promedio = mean(price),
  rating_positivo = sum(positive_ratings),
  rating_negativo = sum(negative_ratings),
  cantidad_jugadores = sum(owners),
  promedio_jugando_min = mean(average_playtime),
  ingresos = sum(owners * price)
  )
  


p<-ggplot(data=summ_year, aes(x=Year, y=ingresos)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=Year), vjust=-0.3, size=3.5)+
  theme_minimal()

unique(data$platforms)
unique(data$categories)

length(unique(data$developer))

length(unique(description_data$steam_appid))
length(unique(data$appid))












