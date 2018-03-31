x = seq(from=-3, to=3, by=0.1)                 # Specify vector of x values.
y = x^3                                        # Specify corresponding y values.
plot(x, y, col="skyblue", type="l")            # Plot the x,y points as a blue line.
openGraph(width=3, height=4)                   # open a graphics window
plot(x=1:4, y=c(1,3,2,4), type="o")            # make a plot in the screen window
saveGraph(file="Exercise-03-03", type="png")   # save the graph as "temp.pdf"