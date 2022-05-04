# UI para aplicación de visualización de ruido en Ruzafa con barra de navegación superior.
shinyUI(
  navbarPage("Visualización de ruido en Ruzafa",
             header = "",
             theme = shinytheme("united"),
             
             # Panel de mapa de calor
             tabPanel("Mapa de calor",
                      
                      # Información introductoria
                      tags$h4("¡Interactúa con los datos!"),
                      HTML("<p>Esta visualización te permitirá ver qué días hay más o menos ruido para cada sensor de un solo vistazo.<br>Puedes modificar la variable, el sensor, el rango de fechas... ¡e incluso comparar dos sensores! Pasa el cursor sobre los recuadros de colores para saber a qué día corresponden y cuál es su  valor.<br>Es recomendable leer el apartado de ayuda previamente.<br>Haz click en el botón de herramientas para poder modificarlo a tu gusto.<br></p>"),
                      
                      # Botón de configuración
                      boton_config,
                      br(),
                      
                      # Mostrar el primer mapa de calor 
                      plotlyOutput("heatmap"),
                      
                      # Mostrar el segundo mapa de calor si el switch de comparación está activo
                      conditionalPanel(
                        condition = "input.comparar",
                        plotlyOutput("heatmap2")
                      )),
             
             # Panel de visualización geográfica
             visualizacion_geo_tab,
             
             # Panel con sub-paneles de ayuda e información
             navbarMenu("Ayuda", 
                        icon = icon("info-circle"),
                        
                        # Sub-panel con información sobre la aplicación
                        info_aplicacion_tab,
                        
                        # Sub-panel con definiciones sobre los datos
                        definiciones_tab,
                        
                        # Sub-panel con información sobre el ruido
                        info_ruido_tab
             ))
)
