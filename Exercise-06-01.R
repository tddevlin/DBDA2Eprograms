source("DBDA2E-utilities.R")
source("BernBeta.R")
# (A)
prior = c(4, 4)
post = BernBeta(priorBetaAB = prior, Data = 1)
post # posterior is beta(5,4)

# (B)
newPost = BernBeta(priorBetaAB = post, Data = 1)
newPost # new posterior is beta(6,4)

# (C)
finalPost = BernBeta(priorBetaAB = newpost, Data = 0)
finalPost # beta(6,5)

# (D)
update1 = BernBeta(prior, 0)
update2 = BernBeta(update1, 1)
reorderedPost = BernBeta(update2, 1)
reorderedPost # beta(6,5) -- same posterior because of data-order invariance
