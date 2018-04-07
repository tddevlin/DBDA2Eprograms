source("DBDA2E-utilities.R")
source("BernBeta.R")

prior = c(0.1, 0.1)
heads = 4
tails = 1
post = BernBeta(prior, c(rep(1, heads), rep(0, tails)), showCentTend = "Mode")
