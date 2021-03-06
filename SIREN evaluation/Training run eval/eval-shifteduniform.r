a1 <- read.csv("initialization=uniform, c=2.0, shifted=TRUE.log")
a2 <- read.csv("initialization=uniform, c=2.5, shifted=TRUE.log")
a3 <- read.csv("initialization=uniform, c=3.0, shifted=TRUE.log")
a4 <- read.csv("initialization=uniform, c=3.5, shifted=TRUE.log")
a5 <- read.csv("initialization=uniform, c=4.0, shifted=TRUE.log")
a6 <- read.csv("initialization=uniform, c=4.5, shifted=TRUE.log")
a7 <- read.csv("initialization=uniform, c=5.0, shifted=TRUE.log")
a8 <- read.csv("initialization=uniform, c=5.1, shifted=TRUE.log")
a9 <- read.csv("initialization=uniform, c=5.2, shifted=TRUE.log")
a10 <- read.csv("initialization=uniform, c=5.3, shifted=TRUE.log")

a1 <- a1$loss
a2 <- a2$loss
a3 <- a3$loss
a4 <- a4$loss
a5 <- a5$loss
a6 <- a6$loss
a7 <- a7$loss
a8 <- a8$loss
a9 <- a9$loss
a10 <- a10$loss

PSNR <- function(x) -10*log10(x)

plot(PSNR(a1),type="line",ylim=c(10,80),xlab="Iteration", ylab="PSNR", col="red")
lines(PSNR(a2),col="cornsilk")
lines(PSNR(a3),col="cornsilk")
lines(PSNR(a4),col="cornsilk1")
lines(PSNR(a5),col="cornsilk2")
lines(PSNR(a6),col="cornsilk3")
lines(PSNR(a7),col="pink")
lines(PSNR(a8),col="darkgreen")
lines(PSNR(a9),col="blue")
lines(PSNR(a10),col="black")

library(tikzDevice)
options("tikzLatex"='C:\\Program Files\\MiKTeX 2.9\\miktex\\bin\\x64\\pdflatex.exe')
options(tikzMetricPackages = c("\\usepackage[utf8]{inputenc}","\\usepackage[T1]{fontenc}", "\\usetikzlibrary{calc}", "\\usepackage{amssymb}"))

tikz('shifteduniform.tex',width=5,height=3.5)
plot(PSNR(a1),type="line",ylim=c(10,80),xlab="Iteration", ylab="PSNR", col="red")
lines(PSNR(a2),col="cornsilk")
lines(PSNR(a3),col="cornsilk")
lines(PSNR(a4),col="cornsilk1")
lines(PSNR(a5),col="cornsilk2")
lines(PSNR(a6),col="cornsilk3")
lines(PSNR(a7),col="pink")
lines(PSNR(a8),col="darkgreen")
lines(PSNR(a9),col="blue")
lines(PSNR(a10),col="black")
dev.off()