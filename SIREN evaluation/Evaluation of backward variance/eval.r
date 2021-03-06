n = 20
w = 64

Q <- Vectorize(function(n, w, c, which) {
  x <- runif(w, -pi/2, pi/2)
  M <- array(runif(w*w*n, min=-c/sqrt(w), max=c/sqrt(w)), c(n, w, w))
  
  arcsine_variances = c()
  normal_variances = c()
  
  x <- cos(x)
  for(i in 1:n) {
    x <- M[i,,] %*% x
    normal_variances <- append(normal_variances,var(x))
    x <- cos(x)
    arcsine_variances <- append(arcsine_variances, var(x))
  }
  
  if(which == "normal")
    return(mean(abs((sqrt(normal_variances) - sqrt(c^2/6.0))/sqrt(c^2/6.0))))
  else if(which == "arcsine")
    return(mean(abs((sqrt(arcsine_variances) - sqrt(0.5))/sqrt(0.5))))
  else
    warning("Wrong which parameter in Q, which=\"" + which + "\"")
})

if(!file.exists("q.rds")) {
  q <- Q(n,w,(1:5000)/500, "arcsine")
  saveRDS(q, "q.rds")
} else q <- readRDS("q.rds")

if(!file.exists("r.rds")) {
  r <- Q(n,w,(1:5000)/500, "normal")
  saveRDS(r, "r.rds")
} else r <- readRDS("r.rds")

plot((1:5000)/500, r,type="l",col="blue")
lines((1:5000)/500, q)

library(tikzDevice)
options("tikzLatex"='C:\\Program Files\\MiKTeX 2.9\\miktex\\bin\\x64\\pdflatex.exe')
options(tikzMetricPackages = c("\\usepackage[utf8]{inputenc}","\\usepackage[T1]{fontenc}", "\\usetikzlibrary{calc}", "\\usepackage{amssymb}"))


tikz('backward_variance_deviation.tex',width=5,height=3.5)
plot((1:5000)/500, r,type="l",col="blue")
lines((1:5000)/500, q)
dev.off()