a1 <- read.csv("initialization=normal, c=2.5, shifted=TRUE.log")
a2 <- read.csv("initialization=normal, c=3.0, shifted=TRUE.log")
a3 <- read.csv("initialization=normal, c=3.1, shifted=TRUE.log")

a1 <- a1$loss
a2 <- a2$loss
a3 <- a3$loss

PSNR <- function(x) -10*log10(x)

plot(PSNR(a1),type="line",ylim=c(10,80),xlab="Iteration", ylab="PSNR",col="red")
lines(PSNR(a2),col="cornsilk2")
lines(PSNR(a3),col="black")

library(tikzDevice)
options("tikzLatex"='C:\\Program Files\\MiKTeX 2.9\\miktex\\bin\\x64\\pdflatex.exe')
options(tikzMetricPackages = c("\\usepackage[utf8]{inputenc}","\\usepackage[T1]{fontenc}", "\\usetikzlibrary{calc}", "\\usepackage{amssymb}"))

tikz('shiftednormal.tex',width=5,height=3.5)
plot(PSNR(a1),type="line",ylim=c(10,80),xlab="Iteration", ylab="PSNR",col="red")
lines(PSNR(a2),col="cornsilk2")
lines(PSNR(a3),col="black")
dev.off()