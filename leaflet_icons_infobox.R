# Definimos los iconos que tendrán los sensores y los servicios de hostelería
icon_hosteleria <- makeAwesomeIcon(
  icon = "cutlery",
  iconColor = "black",
  markerColor = "orange"
)

icon_sonometro <- awesomeIconList(
  "Nivel 3" = makeAwesomeIcon(
    icon = "volume-up",
    iconColor = "black",
    markerColor = "darkred",
    library = "fa"
  ),
  "Nivel 2" = makeAwesomeIcon(
    icon = "volume-up",
    iconColor = "black",
    markerColor = "red",
    library = "fa"
  ),
  "Nivel 1" = makeAwesomeIcon(
    icon = "volume-up",
    iconColor = "black",
    markerColor = "lightred",
    library = "fa"
  )
)

# Caja de información para el mapa interactivo
info.box <- HTML(paste0(
  HTML(
    '<div class="modal fade" id="infobox" role="dialog"><div class="modal-dialog"><!-- Modal content--><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button>'
  ),
  
  # Título
  HTML("<h3>Información</h3>"),
  HTML(
    '</div><div class="modal-body">'
  ),
  
  # Cuerpo del texto
  HTML('<h4>Botones</h4>
<p>En la esquina superior izquierda, hay cinco botones. Los dos primeros son para hacer más y menos zoom; el tercero es para regresar a la vista inicial, el cuarto para buscar y situar la vista en el sensor que queramos y, por último, el botón de mostrar la información.</p>
<hr>
<h4>Interactividad</h4>
<p>En el mapa hay círculos con números en su interior. Este número corresponde a la cantidad de locales que hay en esa zona. Si hacemos click, hará zoom y creará nuevos grupos. Si hacemos click sucesivamente, podremos ver a qué locales corresponden.<br>
Si pinchamos en el local, podremos ver información relativa a ellos. De la misma manera, si hacemos click en un sensor, nos mostrará su información.</p>
<hr>
<h4>Indicaciones breves</h4>
<p>Cuanto más oscuro sea el rojo del círculo que rodea al sensor, más ruidoso es. De la misma forma, cuanto más claro, menos ruidoso. Los locales son aquellos coloreados de naranja. </p>
<hr>
<h4>Obtención de datos</h4>
<p>Datos de los sensores extraídos del <a href="https://www.valencia.es/dadesobertes/es/data/?groups=medio-ambiente">Portal de Datos Abiertos del Ayuntamiento de Valencia</a>.<br>
Datos de bares y restaurantes extraídos de Google Maps a través de web scraping.</p>'),
  
  # Cerrar ventana
  HTML('</div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div></div>')
))