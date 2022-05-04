library(knitr)
library(tidyverse)
library(lubridate)
library(magrittr)
library(leaflet)
library(leaflet.extras)
library(shiny)
library(shinythemes)
library(GGally)
library(shinyWidgets)
library(plotly)
library(skimr)
library(htmlwidgets)
library(forcats)
library(ggridges)
library(viridis)
library(naniar)

load("./data/data.Rdata")

date_heatmap <- function(df){
  ggplot(df, aes(monthweek, weekdayf, text = text)) + 
    geom_tile(aes(fill = valor)) + 
    facet_grid(year~month) +
    scale_fill_viridis_c(option = "plasma", na.value = "gray65") +
    scale_y_discrete(limits = rev) +
    labs(x="Semana del mes", y = "", subtitle = "")
}

interactive_date_heatmap <- function(p){
  ggplotly(p, tooltip = "text") %>% 
    config(displayModeBar = FALSE)
}

source("visualizacion_geografica.R", local = TRUE, encoding = "UTF-8")
source("boton_config.R", local = TRUE, encoding = "UTF-8")
source("tabs.R", local = TRUE, encoding = "UTF-8")