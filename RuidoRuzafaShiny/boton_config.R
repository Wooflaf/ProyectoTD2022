boton_config <- dropdown(
  tags$h3("Configuración"),
  
  # Selector del rango de fechas
  dateRangeInput("date_rg",
                 label = "Selecciona el rango de fechas",
                 start = "2020-09-17", end = today() - 1,
                 min = "2020-09-17", max = today() - 1,
                 separator = " - ", format = "dd/mm/yy",
                 startview = "year", language = "es",
                 weekstart = 1
  ),
  
  # Selector del sensor
  pickerInput("calle", "Selecciona el sensor", 
              choices = names(ids), selected = "sueca61",
              options = list(style = "btn-primary")),
  
  # Selector de la medida
  pickerInput("med", "Selecciona la medida", 
              choices = c("LAeq", "LAeq_d", 
                          "LAeq_den", "LAeq_e", "LAeq_n"), 
              selected = "LAeq",
              options = list(style = "btn-warning")),
  
  # Botón switch para permitir la aparición del selector del segundo sensor
  switchInput(
    inputId = "comparar",
    label = "Comparar",
    onStatus = "success",
    offStatus = "danger"
  ),
  
  # Selector del segundo sensor condicionado al switch previo
  conditionalPanel(
    condition = "input.comparar",
    pickerInput("calle2", "Selecciona el segundo sensor",
                choices = names(ids),
                options = list(style = "btn-success"))
  ),
  
  # Configuración del botón dropdown
  style = "material-circle", 
  icon = icon("gear", verify_fa = F),
  status = "danger", width = "250px",
  animate = animateOptions(
    enter = animations$fading_entrances$fadeInLeftBig,
    exit = animations$fading_exits$fadeOut
  )
)