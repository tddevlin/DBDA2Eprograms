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

saveGraph( file="Exercise-09-01B" , type="png" )


# (C) -------------------------------------------------------------------------

# MEAN MODEL

# Optional generic preliminaries:
graphics.off() # This closes all of R's graphics windows.
rm(list=ls())  # Careful! This clears all of R's memory!
#------------------------------------------------------------------------------- 
# Load The data 
myData = read.csv("TherapeuticTouchData.csv")
# N.B.: The functions below expect the data to be a data frame, 
# with one component named y being a vector of integer 0,1 values,
# and one component named s being a factor of subject identifiers.
#------------------------------------------------------------------------------- 
# Load the relevant model into R's working memory:
source("Exercise-09-01C-mean-model.R")
#------------------------------------------------------------------------------- 
# Optional: Specify filename root and graphical format for saving output.
# Otherwise specify as NULL or leave saveName and saveType arguments 
# out of function calls.
fileNameRoot = "Exercise-09-01C-mean-" 
graphFileType = "png" 
#------------------------------------------------------------------------------- 
# Generate the MCMC chain:
startTime = proc.time()
mcmcCoda = genMCMC( data=myData , sName="s" , yName="y" , 
                    numSavedSteps=20000 , saveName=fileNameRoot ,
                    thinSteps=10 )
stopTime = proc.time()
show( stopTime-startTime )
#------------------------------------------------------------------------------- 
# Display posterior information:
plotMCMC( mcmcCoda , data=myData , sName="s" , yName="y" , 
          compVal=0.5 , #rope=c(0.45,0.55) ,
          diffIdVec=c(1,14,28), compValDiff=0.0, #ropeDiff = c(-0.05,0.05) ,
          saveName=fileNameRoot , saveType=graphFileType )
#------------------------------------------------------------------------------- 


# MODE MODEL

# Optional generic preliminaries:
graphics.off() # This closes all of R's graphics windows.
rm(list=ls())  # Careful! This clears all of R's memory!
#------------------------------------------------------------------------------- 
# Load The data 
myData = read.csv("TherapeuticTouchData.csv")
# N.B.: The functions below expect the data to be a data frame, 
# with one component named y being a vector of integer 0,1 values,
# and one component named s being a factor of subject identifiers.
#------------------------------------------------------------------------------- 
# Load the relevant model into R's working memory:
source("Exercise-09-01C-mode-model.R")
#------------------------------------------------------------------------------- 
# Optional: Specify filename root and graphical format for saving output.
# Otherwise specify as NULL or leave saveName and saveType arguments 
# out of function calls.
fileNameRoot = "Exercise-09-01C-mode-" 
graphFileType = "png" 
#------------------------------------------------------------------------------- 
# Generate the MCMC chain:
startTime = proc.time()
mcmcCoda = genMCMC( data=myData , sName="s" , yName="y" , 
                    numSavedSteps=20000 , saveName=fileNameRoot ,
                    thinSteps=10 )
stopTime = proc.time()
show( stopTime-startTime )
#------------------------------------------------------------------------------- 
# Display posterior information:
plotMCMC( mcmcCoda , data=myData , sName="s" , yName="y" , 
          compVal=0.5 , #rope=c(0.45,0.55) ,
          diffIdVec=c(1,14,28), compValDiff=0.0, #ropeDiff = c(-0.05,0.05) ,
          saveName=fileNameRoot , saveType=graphFileType )
#------------------------------------------------------------------------------- 