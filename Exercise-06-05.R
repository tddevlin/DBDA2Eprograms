source("DBDA2E-utilities.R")
source("BernBeta.R")

# (A)
# peaked prior around 0.5 to indicate strong belief that coin is fair
prior = c(100, 100) 
post = BernBeta(prior, c(rep(1, 9), rep(0, 1)), showCentTend = "Mean")
# predicted probability for 11th flip is mean of posterior, i.e. 0.519

# (B)
# prior has min at theta=0.5 to reflect belief that coin is likely biased
prior = c(0.6, 0.6)
post = BernBeta(prior, c(rep(1, 9), rep(0, 1)), showCentTend = "Mean")
# predicted probability for 11th flip is mean of posterior, i.e. 0.857
