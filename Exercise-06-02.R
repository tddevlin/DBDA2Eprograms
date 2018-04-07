source("DBDA2E-utilities.R")
source("BernBeta.R")

# (A)
prior = c(1,1) # uniform prior
preferA = 58
preferB = 100 - preferA
post = BernBeta(prior, c(rep(1, preferA), rep(0, preferB)), showHDI = T)
# 95% HDI is [0.483, 0.673]

# (B)
newPreferA = 57
newPreferB = 100 - newPreferA
newPost = BernBeta(post, c(rep(1, newPreferA), rep(0, newPreferB)), showHDI = T)
# 95% HDI is [0.506, 0.642]