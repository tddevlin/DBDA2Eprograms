graphics.off()
source("DBDA2E-utilities.R")
source("BernGrid.R")

# single flip has small effect on informed prior
Theta = seq( 0 , 1 , length=5 )  # Sparse teeth for Theta.
pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,0),rep(1,1))      # Single flip with 1 head

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="None" , showHDI=FALSE , showpD=FALSE )
saveGraph(file="BernGridExample0",type="pdf")
#------------------------------------------------------------------------------
# single flip has small effect on informed prior
Theta = seq( 0 , 1 , length=11 )  # Sparse teeth for Theta.
pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,0),rep(1,1))      # Single flip with 1 head

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="None" , showHDI=FALSE , showpD=FALSE )
saveGraph(file="BernGridExample1",type="pdf")
#------------------------------------------------------------------------------
# single flip has large effect on uniform prior
Theta = seq( 0 , 1 , length=1001 ) # Fine teeth for Theta.
pTheta = rep(1,length(Theta))      # Uniform (horizontal) shape for pTheta.
pTheta = pTheta/sum(pTheta)        # Make pTheta sum to 1.0
Data = c(rep(0,0),rep(1,1))        # Single flip with 1 head

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="None" , showHDI=FALSE , showpD=FALSE )
saveGraph(file="BernGridExample2",type="pdf")
#------------------------------------------------------------------------------
# single flip can rule out extreme possibilities
Theta = seq( 0 , 1 , length=1001 ) # Fine teeth for Theta.
pTheta = rep(0,length(Theta))      # Only extremes are possible!
pTheta[2] = 1                      # Only extremes are possible!
pTheta[length(pTheta)-1] = 1       
pTheta = pTheta/sum(pTheta)        # Make pTheta sum to 1.0
Data = c(rep(0,0),rep(1,1))        # Single flip with 1 head

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="None" , showHDI=FALSE , showpD=FALSE )
saveGraph(file="BernGridExample3",type="pdf")
#------------------------------------------------------------------------------


# just four flips change the shape of a diffuse prior
Theta = seq( 0 , 1 , length=1001 )  # Fine teeth for Theta.
pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,3),rep(1,1))      # 25% heads, N=4

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
saveGraph(file="BernGridExample4",type="pdf")
#------------------------------------------------------------------------------
# four flips hs a small effect on a peaked prior
Theta = seq( 0 , 1 , length=1001 )  # Fine teeth for Theta.
pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
pTheta = pTheta^10               # Sharpen pTheta !
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,3),rep(1,1))      # 25% heads, N=4

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
saveGraph(file="BernGridExample5",type="pdf")
#------------------------------------------------------------------------------
# likelihood is almost identical to posterior when prior is flat
Theta = seq( 0 , 1 , length=1001 )  # Fine teeth for Theta.
pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
pTheta = pTheta^0.1              # Flatten pTheta !
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,3),rep(1,1))      # 25% heads, N=4

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
saveGraph(file="BernGridExample6",type="pdf")
#------------------------------------------------------------------------------

# likelihood can dominate a peaked prior if there's enough data
Theta = seq( 0 , 1 , length=1001 )  # Fine teeth for Theta.
pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,30),rep(1,10))    # 25% heads, N=40

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
saveGraph(file="BernGridExample7",type="pdf")
#------------------------------------------------------------------------------
# even a lot of data cannot affect a very peaked prior
Theta = seq( 0 , 1 , length=1001 )  # Fine teeth for Theta.
pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
pTheta = pTheta^10               # Sharpen pTheta !
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,30),rep(1,10))    # 25% heads, N=40

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
saveGraph(file="BernGridExample8",type="pdf")
#------------------------------------------------------------------------------
# likelihood dominates a flat prior
Theta = seq( 0 , 1 , length=1001 )  # Fine teeth for Theta.
pTheta = pmin( Theta , 1-Theta ) # Triangular shape for pTheta.
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
pTheta = pTheta^0.1              # Flatten pTheta !
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,30),rep(1,10))    # 25% heads, N=40

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
saveGraph(file="BernGridExample9",type="pdf")
#------------------------------------------------------------------------------
# a near equivocal likelihood can dramatically shape the posterior if the prior
# is unusual
Theta = seq( 0 , 1 , length=1000 )  # Fine teeth for Theta.
# Two triangular peaks on a small non-zero floor:
pTheta = c( rep(1,200),seq(1,100,length=50),seq(100,1,length=50),rep(1,200) , 
            rep(1,200),seq(1,100,length=50),seq(100,1,length=50),rep(1,200) )
pTheta = pTheta/sum(pTheta)      # Make pTheta sum to 1.0
Data = c(rep(0,13),rep(1,14)) 

openGraph(width=5,height=7)
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" , 
                      showCentTend="None" , showHDI=FALSE , showpD=FALSE )
saveGraph(file="BernGridExample10",type="pdf")
#------------------------------------------------------------------------------
