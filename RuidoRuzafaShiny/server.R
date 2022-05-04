# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  rval_medida <- reactive({
    date_data %>%
      filter(medida == input$med)
  })
  
  rval_generic <- reactive({
    rval_medida() %>%
      filter(between(dateObserved, input$date_rg[1], input$date_rg[2]))
  })
  
  # Generar dataframe para utilizar en el primer mapa de calor
  rval_df <- reactive({
    rval_generic() %>% 
      filter(street == input$calle)
  })
  
  # Generar dataframe para utilizar en el segundo mapa de calor
  rval_df2 <- reactive({
    rval_generic() %>% 
      filter(street == input$calle2)
  })
  
  # Renderizar el primer mapa de calor
  output$heatmap <- plotly::renderPlotly({
    p <- rval_df() %>% 
      date_heatmap() +
      labs(title = paste("Mapa de calor para la calle", input$calle),
           fill=paste(input$med, "(dB)"))
    
    interactive_date_heatmap(p)
  })
  
  # Renderizar el segundo mapa de calor
  output$heatmap2 <- plotly::renderPlotly({
    p2 <- rval_df2() %>%
      date_heatmap() +
      labs(title = paste("Mapa de calor para la calle", input$calle2),
           fill=paste(input$med, "(dB)"))
    
    interactive_date_heatmap(p2)
  })
  
  # Actualizar el selector del segundo sensor.
  # Quita la opción de escoger el mismo sensor que se ha escogido en el primer selector
  observe({
    updatePickerInput(session, "calle2",
                      label = "Selecciona el segundo sensor",
                      choices = names(ids)[names(ids) != input$calle],
                      selected = input$calle2,
                      options = list(style = "btn-success")
    )
  })
  
  # Renderizar la visualización geográfica
  output$leaflet <- renderLeaflet({visualizacion_geografica()})
  
  # Renderizar la tabla con equivalencias de nombres abreviados de sensores
  output$nombres_calle <- renderTable({nombres_calle}, striped = T)
  
  # Renderizar la tabla con la explicación de cada medida
  output$explicacion_medidas <- renderTable({explicacion_medidas}, striped = T)
  
  # Caja de información para la visualización geográfica
  output$info.box <- renderText({info.box})
  
  # Renderizar la tabla con las escalas de ruido
  output$escala_ruido <- renderTable({escala_ruido}, striped = T)
})
