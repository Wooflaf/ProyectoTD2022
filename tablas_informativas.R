# Tabla con equivalencias de nombres abreviados de sensores
calle <- c("Sueca Esq. Denia", "Cádiz, 16", "Cádiz, 3", "Cuba, 3", "Sueca, 2",
           "Sueca, 61", "Sueca, 32", "Carles Cervera, Chaflán Reina Doña María",
           "Salvador Abril Chaflán Maestro José Serrano", "Vivons Chaflán Cádiz", 
           "Carles Cervera, 34", "Puerto Rico, 21", "Doctor Serrano, 21", 
           "General Prim Chaflán Donoso Cortés")
names(calle) <- names(ids)

nombres_calle <- data.frame(nom_abr = names(calle),
                            calle = paste("Calle", calle)) %>%
  arrange(calle)

names(nombres_calle) <- c("Nombre abreviado", "Calle donde se ubica")


# Tabla con la explicación de cada medida
explicacion_medidas <- data.frame(medida = c("LAeq","LAeq_d","LAeq_den","LAeq_e","LAeq_n"),
                                  explicacion = c("Nivel sonoro continuo equivalente. Se define en la ISO 1996-2:2017 como el valor del nivel de presión en dBA en ponderación A de un sonido estable que en un intervalo de tiempo T posee la misma presión sonora cuadrática media que el sonido que se mide y cuyo nivel varía con el tiempo.",
                                                  "Es un indicador de ruido asociado al día, donde al día le corresponden 12 horas, en el período que se extiende desde las 7 hasta las 19 horas.",
                                                  "Índice de ruido día-tarde-noche, es utilizado para determinar la molestia vinculada a la exposición al ruido.",
                                                  "Es un indicador del nivel sonoro durante la tarde, donde a la tarde le corresponden 4 horas, en el período que se extiende desde las 19 hasta las 23 horas.", 
                                                  "Es un indicador del nivel sonoro durante la noche, donde a la noche le corresponden 8 horas, en el período que se extiende desde las 23 hasta las 7 horas."))

names(explicacion_medidas) <- c("Medida", "Explicación")


# Tabla con las escalas de ruido
escala_ruido <- data.frame(valores = c("130", "120", "110", "100", "90", "80", "70", "60", "50", "40", "30", "0"),
                           info = c("Nivel percibido a unos 10 metros de distancia de un avión, el ruido es absolutamente insoportable y doloroso.",
                                    "Muy peligroso; se necesita alguna protección del oído. Este ruido es el emitido por el reactor de un avión volando a 50 metros.",
                                    "Peligrosos y muy molestos. Son habituales en una discoteca, en un concierto de rock y a 100 metros de un avión aterrizando.",
                                    "Riesgo muy grave si la audición es prolongada. Este nivel es frecuente en muchos ambientes laborales industriales.",
                                    "Ambiente muy ruidoso y resultan peligrosos si la exposición se produce por largo tiempo. Es el nivel de ruido característico de un vehículo pesado circulando a 60 km/h y percibido desde unos 10 metros.",
                                    "Ambientes bastante ruidosos, como el de una calle con tránsito intenso o algunos electrodomésticos como aspiradoras o lavadoras.",
                                    "Ambiente ruidoso, habitual en zonas comerciales y muchos bares, en el interior de un tren o de un coche.",
                                    "Ambiente poco ruidoso y es el nivel habitual de sonido de la voz en una conversación normal.",
                                    "Aambiente tranquilo, aunque todavía interfieren en el sueño. Es el nivel habitual de una sala de estudio.",
                                    "Ambiente de calma y admisibles para mantener el sueño.",
                                    "Por debajo de este valor se estima que el ambiente es silencioso.",
                                    "Nivel mínimo de audición"))

names(escala_ruido) <- c("Nivel de presión (dBA)", "Observaciones")