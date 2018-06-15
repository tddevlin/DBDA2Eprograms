# Generate the data from Figure 9.12
totalTrials = 100
successCounts = c(30, 40, 50, 60, 70)
y = c()
s = c()
for (numSuccesses in successCounts) {
  y = c(y, rep(c(1, 0), c(numSuccesses, totalTrials - numSuccesses)))
  s = c(s, rep(as.character(which(successCounts == numSuccesses)), totalTrials))
}
data = data.frame(y=as.integer(y), s=s)

# Load the relevant model into R's working memory:
source("Jags-Ydich-XnomSsubj-MbinomBetaOmegaKappa.R")

#------------------------------------------------------------------------------- 
# Optional: Specify filename root and graphical format for saving output.
# Otherwise specify as NULL or leave saveName and saveType arguments 
# out of function calls.
fileNameRoot = "Exercise-09-03" 
graphFileType = "png" 
#------------------------------------------------------------------------------- 
# Generate the MCMC chain:
startTime = proc.time()
mcmcCoda = genMCMC( data=data , sName="s" , yName="y" , 
                    numSavedSteps=20000 , saveName=fileNameRoot ,
                    thinSteps=10 )
stopTime = proc.time()
show( stopTime-startTime )
#------------------------------------------------------------------------------- 
# Get summary statistics of chain:
summaryInfo = smryMCMC( mcmcCoda , saveName=fileNameRoot )
# Display posterior information:
plotMCMC( mcmcCoda , data=data , sName="s" , yName="y" , 
          compVal=0.5 , #rope=c(0.45,0.55) ,
          diffIdVec=c(1,2,3,4,5), compValDiff=0.0, #ropeDiff = c(-0.05,0.05) ,
          saveName=fileNameRoot , saveType=graphFileType )
#------------------------------------------------------------------------------- 
