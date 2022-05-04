visualizacion_geografica <- function(){
  leaflet() %>%
    addProviderTiles(providers$OpenStreetMap.HOT) %>%
    addAwesomeMarkers(data = hosteleria, lng = ~Longitude, lat = ~Latitude, # Marcadores de hostelería
                      clusterOptions = markerClusterOptions(), # Agrupación de marcadores
                      icon = icon_hosteleria,
                      label = ~name,
                      popup = paste0(
                        "<b> Nombre: </b>",
                        hosteleria$name,
                        "<br>",
                        "<b> Categoría: </b>",
                        hosteleria$Category,
                        "<br>",
                        "<b> Dirección: </b>",
                        hosteleria$Address)) %>% 
    setView(lng = median(hosteleria$Longitude), # Vista inicial: mediana de lats y longs para que esté 'centrada'
            lat = median(hosteleria$Latitude), zoom = 16) %>%
    addAwesomeMarkers(data = all_df_ubi_median, lng = ~longitude, lat = ~latitude, # Marcadores sonómetros
                      icon = ~icon_sonometro[nivel],
                      label = ~street,
                      group = "sonometros",
                      popup = paste0(
                        "<b> Nombre: </b>",
                        all_df_ubi_median$street,
                        "<br>",
                        "<b> Mediana LAeq: </b>",
                        all_df_ubi_median$median_LAeq, " dB")) %>% 
    addCircleMarkers(data = all_df_ubi_median, lng = ~longitude, lat = ~latitude,
                     radius = ~3*sqrt(median_LAeq),
                     opacity = 0.8,
                     color = ~color_pal(scaled),
                     fillOpacity = 0.6) %>% 
    addLegend(position = "bottomright", # Añadimos una leyenda orientativa
              labels = c("Nivel 3", "Nivel 2", "Nivel 1"), 
              colors = c("darkred", "red", "salmon"),
              opacity = .7,
              title = "Sonómetros") %>%
    addResetMapButton() %>% # Botón para poder volver a la vista inicial
    addSearchFeatures(targetGroups = "sonometros") %>% # Botón de búsqueda de sonómetro
    addBootstrapDependency() %>%
    addEasyButton(easyButton(
      icon = "glyphicon-info-sign", title = "Información del mapa",
      onClick = JS("function(btn, map){ $('#infobox').modal('show'); }")
    )) %>%
    htmlwidgets::appendContent(info.box)
}
