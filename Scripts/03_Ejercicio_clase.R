# MAGT
# Anscombe

x1 <- c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5)
y1 <- c(8.04, 6.95, 7.58, 8.81, 8.33, 9.96, 7.24, 4.26,
        10.84, 4.82, 5.68)
DB1 <- data.frame(x1, y1)

mean(DB1$x1); var(DB1$x1)
mean(DB1$y1); var(DB1$y1)

cor.test(DB1$x1, DB1$y1)

plot(DB1$x1, DB1$y1,
     col = "red",
     pch = 19,
     xlab = "Valor de x",
     ylab = "Valor de y")
text(6, 10, "Base datos 1")


DB1.lm <- lm(DB1$y1 ~ DB1$x1)
DB1.lm
summary(DB1.lm)
DB1.lm$fitted.values

DB1$Ajustados <- round(DB1.lm$fitted.values,2)
DB1$ForAjus <- 3.0 + 0.5*DB1$x1

# Agregar la línea de tendencia central con la función abline
plot(DB1$x1, DB1$y1,
     col = "red",
     pch = 19,
     xlab = "Valor de x",
     ylab = "Valor de y")
text(6, 10, "Base datos 1")

abline(DB1.lm, col= "blue")
sum(DB1.lm$residuals)
