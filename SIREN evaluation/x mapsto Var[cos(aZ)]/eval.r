f <- Vectorize(function(x) var(cos(x*rnorm(1000000))))

x = (1:4000)/100 #was supposed to be 1:400 but now I've calculated it,
                 #so there's no reason to throw it away. It takes a fair
                 #amount of time though, so if you're deleting fx.rds and running
                 #this yourself you may want to reduce this to 400.

                 #There's an analytical formula for this anyway and this whole
                 #program is only to verify that I didn't make any calculation
                 #errors.

if(!file.exists("fx.rds")) {
  fx <- f(x)
  saveRDS(fx, "fx.rds")
} else
  fx <- readRDS("fx.rds")

plot(x, fx, xlim=c(0,4), ylab="Var[cos(aZ)]", xlab="a", type="line")
lines(x, 0.5+0.5*exp(-2*x^2) - exp(-x^2),col="red", lty="dashed")