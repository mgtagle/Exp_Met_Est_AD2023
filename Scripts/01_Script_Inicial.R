# Marco Aurelio
# 123456789
# 29/08/2023

# Importar datos de un archivo de excel a la consola de R
# función "read.csv"


setwd("C:/Repositorios/Exp_Met_Est_AD2023/Scripts")
# Importar ----------------------------------------------------------------

ocampo <- read.csv("EMA_Ocampo.csv", header = TRUE)
head(ocampo)
tail(ocampo)



# Descriptivas ------------------------------------------------------------

mean(ocampo$DIRS)
mean(ocampo$TEMP)
median(ocampo$TEMP)
sd(ocampo$TEMP)
var(ocampo$TEMP)
range(ocampo$TEMP)
fivenum(ocampo$TEMP)

# Gráficas ----------------------------------------------------------------

boxplot(ocampo$TEMP,
        col = "lightgreen",
        ylim=c(10, 30),
        ylab = "Temp °C",
        main = "EMA Ocampo",
        horizontal = T)
mtext("Ema", side =4, adj = 1, padj = 1)
mtext("Datos de agosto 2023", side = 1, padj = 3, adj = 1)



# Datos vivero ------------------------------------------------------------

IE <- read.csv("Vivero_IE.csv", header = T)
IE$Tratamiento <- as.factor(IE$Tratamiento)

mean(IE$IE)

tapply(IE$IE, IE$Tratamiento, mean)
tapply(IE$IE, IE$Tratamiento, length)



# Normalidad de datos -----------------------------------------------------

# Shapiro Wilks

shapiro.test(IE$IE)


# Homogeneidad de varianzas ----------------------------------------------
bartlett.test(IE$IE ~ IE$Tratamiento)

# Aplicar la prueba de t para muestras independientes

t.test(IE$IE ~ IE$Tratamiento, var.equal = T)


# Prueba de t de una muestra
# Subconjunto con los datos de Ctrl y Fert

Ctrl <- subset(IE$IE, IE$Tratamiento == "Ctrl")
Fert <- subset(IE$IE, IE$Tratamiento == "Fert")

t.test(Ctrl, mu = 0.95)
t.test(Ctrl, mu = 0.80)

aire <- airquality


# prueba de t dependients
# Datos de airquality de la ciudad de NY, USA
# Comparar las variables en dos periodos verano (junio)
# Otoño (septiembre)

boxplot(aire$Ozone ~ aire$Month)
boxplot(aire$Temp ~ aire$Month)
aire$centi <- round((aire$Temp - 32) / 1.8,1)
boxplot(aire$centi ~ aire$Month)


# Crear un subcojunto solo con los meses de Junio y Sept

aire.jun <- subset(aire, Month == "6")
aire.sep <- subset(aire, Month == "9")


t.test(aire.jun$Wind , aire.sep$Wind, paired =T)
boxplot(aire$Wind ~ aire$Month)
