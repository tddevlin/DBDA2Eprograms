source("DBDA2E-utilities.R")

# (A) -------------------------------------------------------------------------

meanParams = gammaShRaFromMeanSD(mean=1.0, sd=10.0)
modeParams = gammaShRaFromModeSD(mode=1.0, sd=10.0)
meanParams
modeParams


# (B) -------------------------------------------------------------------------

openGraph(height=7, width=7)
layout(matrix(1:3, ncol=1))
x=seq(0, 200, length=10001)

# upper plot
plot(
  x=x,
  y=dgamma(x, modeParams$shape, modeParams$rate),
  ylab="dgamma(x)",
  type="l",
  main="Gamma Distributions (SD = 10)"
)
lines(x, dgamma(x, meanParams$shape, meanParams$rate), col="skyblue")
legend(
  "topright",
  c("Mode 1", "Mean 1"),
  lty=c(1,1),
  col=c("black", "skyblue"),
  text.col=c("black", "skyblue")
)

# middle plot
plot(
  x=x,
  y=dgamma(x, modeParams$shape, modeParams$rate),
  ylab="dgamma(x)",
  type="l",
  ylim=c(0.07, 0.08),
  main="Gamma distributions (SD = 10) zoomed in"
)
lines(x, dgamma(x, meanParams$shape, meanParams$rate), col="skyblue")
legend(
  "topright",
  c("Mode 1", "Mean 1"),
  lty=c(1,1),
  col=c("black", "skyblue"),
  text.col=c("black", "skyblue")
)

# lower plot
plot(
  x=x,
  y=dgamma(x, modeParams$shape, modeParams$rate),
  ylab="dgamma(x)",
  type="l",
  ylim=c(0, 8.0e-5),
  main="Gamma distributions (SD = 10) zoomed in"
)
lines(x, dgamma(x, meanParams$shape, meanParams$rate), col="skyblue")
legend(
  "topright",
  c("Mode 1", "Mean 1"),
  lty=c(1,1),
  col=c("black", "skyblue"),
  text.col=c("black", "skyblue")
)

saveGraph( file="Exercise-09-01-B" , type="png" )
