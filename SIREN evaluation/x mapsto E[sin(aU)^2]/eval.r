f <- Vectorize(function(x) mean(sin(x*runif(1000000,-1,1))**2))

x = 2*pi*(1:2000)/1000

if(!file.exists("fx.rds")) {
  fx <- f(x)
  saveRDS(fx, "fx.rds")
} else
  fx <- readRDS("fx.rds")

plot(NULL, xlim=c(0,4*pi), ylim=c(0,0.7), ylab="E[sin(aX)^2]", xlab="c")
abline(h=0.5, col="blue")
lines(x, fx)

library(tikzDevice)
options("tikzLatex"='C:\\Program Files\\MiKTeX 2.9\\miktex\\bin\\x64\\pdflatex.exe')
options(tikzMetricPackages = c("\\usepackage[utf8]{inputenc}","\\usepackage[T1]{fontenc}", "\\usetikzlibrary{calc}", "\\usepackage{amssymb}"))


tikz('variance.tex',width=5,height=3.5)
plot(x, fx, xlim=c(0,4*pi), ylim=c(0,0.7), ylab="$\\mathbb{E}\\left[\\sin(aX)^2\\right]$", xlab="$a$", type="line")
abline(h=0.5, col="blue")
dev.off()