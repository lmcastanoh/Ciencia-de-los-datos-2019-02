
# Lectura de base de datos Georeferenciada

# Directorio


# Lectura datos
data<- read.csv("accidentalidad_enriquecida.csv", sep=",",dec=",")


# Resumen variables
str(data)

# Nombre de las variables
names(data)

# No se tienen en cuenta las siguientes variables

# X
# Y
# RADICADO
# DIRECCION_ENC
# CBML
# MES_NOMBRE


# Eliminación de variables

# Vector con nombre de columnas a eliminar
variables_rm <- c("X", "Y", "RADICADO", "DIRECCION_ENC", "CBML", "MES_NOMBRE")

# BD sin variables 
data2 <- data[, !(colnames(data) %in% variables_rm), drop = FALSE]


# Corrección FECHA

#data2$FECHA_CORR <- substr (data2$FECHA,1,10)
#data2$FECHA_CORR <- as.Date (data2$FECHA, format = "%Y-%m-%d")


# Crear variables MES_NOMBRE
data2$MES_NOMBRE <- as.POSIXct(data2$FECHA_CORR) 
data2$MES_NOMBRE <- format(data2$FECHA_CORR, "%B") 

# Ordenar los niveles del factor
data2$MES_NOMBRE <- as.factor(data2$MES_NOMBRE)

data2$MES_NOMBRE <- ordered(data2$MES_NOMBRE, 
                                      levels = c("enero", "febrero", "marzo", 
                                                 "abril", "mayo", "junio", "julio",
                                                 "agosto", "septiembre", "octubre",
                                                 "noviembre", "diciembre"))








