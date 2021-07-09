plot(sort(rnorm(1000000)*sin(runif(1000000,-pi/2,pi/2))),sort(rnorm(1000000)),type='l')
lines(sort(runif(1000000, -2, 2)*sin(runif(1000000,-pi/2,pi/2))), sort(rnorm(1000000)), col="blue")
lines(sort(rnorm(100000)),sort(rnorm(100000)),col="red")


library(tikzDevice)
options("tikzLatex"='C:\\Program Files\\MiKTeX 2.9\\miktex\\bin\\x64\\pdflatex.exe')
options(tikzMetricPackages = c("\\usepackage[utf8]{inputenc}","\\usepackage[T1]{fontenc}", "\\usetikzlibrary{calc}", "\\usepackage{amssymb}"))

sparse <- function(x) x[c(rep(FALSE, 100), TRUE)]

tikz('qqplot.tex',width=5,height=3.5)
plot(sparse(sort(rnorm(1000000)*sin(runif(1000000,-pi/2,pi/2)))),sparse(sort(rnorm(1000000))),type='l', ylab="Quantiles", xlab="Normal quantiles")
lines(sparse(sort(runif(1000000, -2, 2)*sin(runif(1000000,-pi/2,pi/2)))), sparse(sort(rnorm(1000000))), col="blue")
lines(sparse(sort(rnorm(100000))),sparse(sort(rnorm(100000))),col="red")
dev.off()