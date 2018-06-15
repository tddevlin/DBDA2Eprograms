
# (A) PARALLEL

#------------------------------------------------------------------------------- 
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
source("Exercise-09-04-parallel.R")
#------------------------------------------------------------------------------- 
# Optional: Specify filename root and graphical format for saving output.
# Otherwise specify as NULL or leave saveName and saveType arguments 
# out of function calls.
fileNameRoot = "Exercise-09-04-parallel-" 
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
# Display diagnostics of chain, for specified parameters:
parameterNames = varnames(mcmcCoda) # get all parameter names for reference
diagMCMC( codaObject=mcmcCoda , parName="omega" , 
            saveName=fileNameRoot , saveType=graphFileType )


# (B) NON-PARALLEL

#------------------------------------------------------------------------------- 
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
source("Exercise-09-04-nonparallel.R")
#------------------------------------------------------------------------------- 
# Optional: Specify filename root and graphical format for saving output.
# Otherwise specify as NULL or leave saveName and saveType arguments 
# out of function calls.
fileNameRoot = "Exercise-09-04-nonparallel-" 
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
# Display diagnostics of chain, for specified parameters:
parameterNames = varnames(mcmcCoda) # get all parameter names for reference
diagMCMC( codaObject=mcmcCoda , parName="omega" , 
          saveName=fileNameRoot , saveType=graphFileType )
