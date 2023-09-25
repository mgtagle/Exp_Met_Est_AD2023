# MAGT
# Correlación
# 
library(repmis)
erupciones <- source_data("https://www.dropbox.com/s/liir6sil7hkqlxs/erupciones.csv?dl=1")

plot(erupciones$waiting, erupciones$eruptions, xlab = "Tiempo de espera entre erupciones (min)",
     ylab = "Duración de las erupciones (min)", pch = 19)

# Promedio de las erupciones
mean(erupciones$eruptions)
mean(erupciones$waiting)

range(erupciones$eruptions)
range(erupciones$waiting)

boxplot(erupciones$eruptions)
boxplot(erupciones$waiting)

# Estableceer H0 y H1
# función de correlación cor.test

cor.test(erupciones$eruptions, erupciones$waiting)



# Canopy ------------------------------------------------------------------

copa <- read.csv("Scripts/canopy_short.csv", header =T)
copa$Forest <- as.factor(copa$Forest)

# Identificaciónde tendencias

plot(copa$Cnpy, copa$LAI4)
plot(copa$Cnpy, copa$GLI)

cor.test(copa$Cnpy, copa$LAI4, method = "speraman")
)
cor.test(copa$Cnpy, copa$GLI)
