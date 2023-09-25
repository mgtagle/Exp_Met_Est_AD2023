# ANOVA

# Datos diámetro en Chihuaha

localidad <- read.csv("Scripts/localidades.csv", header =T)


boxplot(localidad$DAP ~ localidad$Paraje,
        col= "Indianred")

shapiro.test(localidad$DAP)
bartlett.test(localidad$DAP ~ localidad$Paraje)

loc.aov <- aov(localidad$DAP ~ localidad$Paraje)
summary(loc.aov)

TukeyHSD(loc.aov)

plot(TukeyHSD(loc.aov))

tapply(localidad$DAP, localidad$Paraje, mean)
