#------------------------------------------------------------------------------- 
# Optional generic preliminaries:
graphics.off() # This closes all of R's graphics windows.
#-------------------------------------------------------------------------------
# (A) --------------------------------------------------------------------------
#------------------------------------------------------------------------------- 
rm(list=ls())  # Careful! This clears all of R's memory!
graphFileType = "png"
myData = read.csv("z6N8z2N7.csv")
# Load the relevant model into R's working memory:
source("Exercise-08-04-JAGSspec-noData.R")
#------------------------------------------------------------------------------- 
# Optional: Specify filename root and graphical format for saving output.
# Otherwise specify as NULL or leave saveName and saveType arguments 
# out of function calls.
fileNameRoot = "Exercise-08-04A-" 
#------------------------------------------------------------------------------- 
# Generate the MCMC chain:
mcmcCoda = genMCMC( data=myData , numSavedSteps=50000 , saveName=fileNameRoot )
#------------------------------------------------------------------------------- 
# Display posterior information:
plotMCMC( mcmcCoda , data=myData , compVal=NULL , #rope=c(0.45,0.55) ,
          compValDiff=0.0 , #ropeDiff = c(-0.05,0.05) ,
          saveName=fileNameRoot , saveType=graphFileType )
#-------------------------------------------------------------------------------
# (B) --------------------------------------------------------------------------
#------------------------------------------------------------------------------- 
rm(list=ls())  # Careful! This clears all of R's memory!
graphFileType = "png"
myData = read.csv("z6N8z2N7.csv")
# Load the relevant model into R's working memory:
source("Exercise-08-04-JAGSspec-uniformPrior.R")
#------------------------------------------------------------------------------- 
# Optional: Specify filename root and graphical format for saving output.
# Otherwise specify as NULL or leave saveName and saveType arguments 
# out of function calls.
fileNameRoot = "Exercise-08-04B-" 
#------------------------------------------------------------------------------- 
# Generate the MCMC chain:
mcmcCoda = genMCMC( data=myData , numSavedSteps=50000 , saveName=fileNameRoot )
#------------------------------------------------------------------------------- 
# Display posterior information:
plotMCMC( mcmcCoda , data=myData , compVal=NULL , #rope=c(0.45,0.55) ,
          compValDiff=0.0 , #ropeDiff = c(-0.05,0.05) ,
          saveName=fileNameRoot , saveType=graphFileType )
#-------------------------------------------------------------------------------
# (C) --------------------------------------------------------------------------
#------------------------------------------------------------------------------- 
rm(list=ls())  # Careful! This clears all of R's memory!
graphFileType = "png"
myData = read.csv("z6N8z2N7.csv")
# Load the relevant model into R's working memory:
source("Exercise-08-04-JAGSspec-bowlPrior.R")
#------------------------------------------------------------------------------- 
# Optional: Specify filename root and graphical format for saving output.
# Otherwise specify as NULL or leave saveName and saveType arguments 
# out of function calls.
fileNameRoot = "Exercise-08-04C-" 
#------------------------------------------------------------------------------- 
# Generate the MCMC chain:
mcmcCoda = genMCMC( data=myData , numSavedSteps=50000 , saveName=fileNameRoot )
#------------------------------------------------------------------------------- 
# Display posterior information:
plotMCMC( mcmcCoda , data=myData , compVal=NULL , #rope=c(0.45,0.55) ,
          compValDiff=0.0 , #ropeDiff = c(-0.05,0.05) ,
          saveName=fileNameRoot , saveType=graphFileType )
#------------------------------------------------------------------------------- 