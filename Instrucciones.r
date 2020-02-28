# Creando los vectores de valores cada vector será una columna del data frame
paciente <- c("Alfredo Aguirre","Guadalupe Colin", "Miguel Garza","Alicia Zapata")
edad <- c(50,25,32,76)
tiposangre <- c("O+","A+","O-","O+")
peso <- c(95.2,56.4,67,73.1)

# Creando el data frame
df_pacientes <- data.frame(paciente,tiposangre,peso,edad)
df_pacientes

# Creando la lista y mostrando su contenido
lista_pacientes <- list(paciente=paciente,edad=edad,tiposangre=tiposangre,peso=peso)
lista_pacientes

# Creando el data frame
df_pacientes2 <- as.data.frame(lista_pacientes)
df_pacientes2

# Creando un data frame desde un archivo y mostrando el resultado
df_ratones <- read.table("Ratones.txt", header =T, sep = "\t", quote = "")
df_ratones

# Visualizando la estructura de los data frames df_ratones y df_pacientes
str(df_ratones)
str(df_pacientes)

# Creando el data frame, con la función data.frame con el argumento stringsAsFactors = FALSE y consultando su estructura 
df_pacientes <- data.frame(paciente,tiposangre,peso,edad,stringsAsFactors = FALSE)
str(df_pacientes)

# Creando el data frame, con la función read.table y el argumento stringsAsFactors = FALSE y consultando su estructura
df_ratones <- read.table("Ratones.txt", header =T, sep = "\t", quote = "",
                         stringsAsFactors = FALSE)
str(df_ratones)

# Consultando el número de filas y columnas del data frame
dim(df_ratones)
dim(df_pacientes)

# Consultando el número de filas del data frame
nrow(df_ratones)
# Consultando el número de columnas del data frame
ncol(df_ratones)

# Visualizando los nombres de columnas de df_ratones
names(df_ratones)

# Visualizando los nombres de columnas de df_pacientes
colnames(df_pacientes)

# Visualizando los nombres de columnas de df_ratones
names(df_ratones)<-c("Name","weigth","week")
df_ratones

# Visualizando los nombres de columnas de df_pacientes
colnames(df_pacientes) <-c("Nombre","factorRh","kg","edad")
df_pacientes

# Visualizando los nombres de columnas de df_pacientes
rownames(df_pacientes)

# Agregando nombres de renglones al data frame
rownames(df_pacientes)<-c("IMSS4010","IMSS5000","IMSS2345","IMSS0123")
df_pacientes

# Visualizando los atributos del data frame
attributes(df_pacientes)

# Consultando la estructura de iris
str(iris)

# Consultando los primeros renglones de iris
head(iris)

# Obteniendo el elemento de la fila 1, columna 1
iris[1,1]

# Obteniendo el elemento de la fila 1, columna 5
iris[1,5]

# Obteniendo la columna 3
iris[ ,3]

# Obteniendo la fila 15
iris[15, ]

# Obteniendo filas consecutivas todas las columnas
iris[12:16, ]

# Omitiendo una columna
head(iris[ ,-5])

# seleccionando por nombre
iris["25","Sepal.Width"]

# Consultando la columna Sepal.Length, usando el simbolo $
iris$Sepal.Length

# Consultando la columna 1 por medio de corchetes
head(iris[1])
head(iris["Sepal.Length"])

# El máximo de los elementos
max(iris[,1:4])

# suma de los elementos por renglón
rowSums(iris[,1:4])

# Suma de los elementos por columnas
colSums(iris[ ,-5])

# Media de los elementos por columna
colMeans(iris[ ,-5])

# tabla de frecuencias
table(iris$Petal.Width)

# Resumen estadístico por columnas
summary(iris)

# Seleccionando las filas donde Sepal.Length sea mayor a 7
subset(iris,iris$Sepal.Length > 7)

# Seleccionando las filas donde Sepal.Length sea mayor a 7 y mostrando solo las columnas Specie y Sepal.Length
subset(iris,iris$Sepal.Length > 7,select=c(Species,Sepal.Length))

# Generando el vector sexo
sexo<-c("M","F","M","F")
# Agregando la columna sexo al data frame
df_pacientes<-cbind(df_pacientes,sexo)
df_pacientes

# Geneando la lista con los datos de un paciente
nuevo_paciente<-list("Antonio Valencia","O+",38,10,"M")
# Agregando la lista al data frame
df_pacientes<-rbind(df_pacientes,IMSS3967=nuevo_paciente)
df_pacientes

# Agregando la columna temperatura
df_pacientes$temperatura<-c(37,36.5,38,36.1,39)

# Agregando la columna estatura
df_pacientes["estatura"]<-c(1.75,1.69,1.83,1.5,1.4)
df_pacientes
