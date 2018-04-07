source("DBDA2E-utilities.R")
source("BernBeta.R")

# Encode F by 0 and J by 1

prior = c(1,1) # uniform prior

# Experiment 1
F1 = 40
J1 = 10
post1 = BernBeta(prior, Data = c(rep(0, F1), rep(1, J1)), showHDI = T)
# The value of theta = 0.5 (which represents unbiasedness) is far outside
# the 95% HDI [0.107, 0.323]. The subjects exhibit bias toward F.

# Experiment 2
F2 = 15
J2 = 35
post2 = BernBeta(prior, Data = c(rep(0, F2), rep(1, J2)), showHDI = T)
# The value of theta = 0.5 (which represents unbiasedness) is outside
# the 95% HDI [0.567, 0.813]. The subjects exhibit bias toward J.