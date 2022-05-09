# Panel de visualización geográfica
visualizacion_geo_tab <- tabPanel("Visualización geográfica",
                        sidebarLayout(
                          sidebarPanel(
                            tags$h4("Mapa con los sensores y servicios de hostelería cercanos"),
                            htmlOutput("info.box")
                          ),
                          
                          mainPanel(
                            # Visualización del gráfico geográfico
                            leafletOutput("leaflet", height = "90vh")
                          )
                        )
)

# Sub-panel con información sobre la aplicación
info_aplicacion_tab <- tabPanel("Sobre la aplicación",
                tags$h2("Sobre la aplicación"),
                
                tags$h3("Objetivo"),
                HTML("<p>Esta aplicación tiene como objetivo permitir al usuario visualizar los niveles de ruido del barrio de Ruzafa de forma interactiva.<br>Mediante el mapa de calor, podrá observar cuándo son mayores (o menores) los niveles de ruido.<br>Con la visualización geográfica podrá además hacerse una idea de por qué se pueden estar dando esos valores.</p>"),
                
                tags$h3("Obtención de datos"),
                HTML('<p>Datos de los sensores extraídos del <a href="https://www.valencia.es/dadesobertes/es/data/?groups=medio-ambiente">Portal de Datos Abiertos del Ayuntamiento de Valencia</a>.<br>Datos de bares y restaurantes extraídos de Google Maps mediante web scraping.</p>'),
                
                tags$h3("Limitación de los datos"),
                HTML("<p>Los datos que hemos podido obtener de bares y restaurantes son los que hemos podido extraer de Google Maps. Es muy posible que algunos locales no estén presentes en el mapa. A pesar de ello, hay un total de 226; una cantidad más que suficiente para conseguir una buena representación.</p>"),
                
                tags$h3("Datos de contacto"),
                HTML("<p>Si has detectado algún error, dato incorrecto, o información adicional que pueda mejorar la aplicación, puedes mandarme un email a <a href = 'mailto: omeal@alumni.uv.es'>omeal@alumni.uv.es</a> para poder corregirlo.</p>")
)

# Sub-panel con definiciones sobre los datos
definiciones_tab <- tabPanel("Definiciones",
                             tags$h2("Definiciones"),
                             
                             tags$h3("Tabla con el nombre abreviado del sensor y su calle"),
                             tableOutput("nombres_calle"),
                             
                             tags$h3("Tabla con la explicación de cada medida"),
                             tableOutput("explicacion_medidas")
)

# Sub-panel con información sobre el ruido
info_ruido_tab <- tabPanel("Información sobre el ruido",
                
                tags$h2("Información sobre el ruido"),
                
                tags$h3("¿Cuáles son los diferentes niveles de ruido?"),
                tableOutput("escala_ruido"),
                
                tags$h3("¿Qué efectos tiene sobre nosotros?"),
                HTML("<p>La Organización Mundial de la Salud (OMS), la Comunidad Económica Europea (CEE) y El Consejo Suprior de Investigaciones Científicas, (CSIC), han declarado de forma unánime que el ruido tiene efectos para la salud tanto fisiológicos como psicológicos.</p><p>La exposición prolongada al ruido, puede causar problemas médicos como hipertensión y enfermedades cardiacas.</p><p>Los ruidos por encima de 80dB pueden desembocar en conductas agresivas y síntomas psiquiátricos, aunque la principal consecuencia es la pérdida de audición.</p><p>Dentro de los efectos adversos del ruido se pueden incluir:</p><ul><li>Cefaleas</li><li>Dificultad para la comunicación oral y capacidad auditiva</li><li>Perturbación del sueño y del descanso</li><li>Estrés, fatiga, depresión, nerviosismo</li><li>Gastritis</li><li>Disfunción sexual</li></ul>"),
                
                tags$h3("Las consecuencias no son solo individuales"),
                HTML("<p>Los efectos de unos niveles de ruido altos no son solo personales, sino que también pueden llegar a tener un gran impacto socio-económico.<br>La siguiente imagen lo ilustra:<br /></p><img src='http://agrega.juntadeandalucia.es/repositorio/29092010/d3/es-an_2010092913_9102738/ODE-98028a38-7992-32ef-9cde-23bf2ba1683c/efectos_ruido.jpg' alt='Ruido-imagen'>")
)