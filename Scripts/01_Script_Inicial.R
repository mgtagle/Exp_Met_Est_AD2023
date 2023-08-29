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
