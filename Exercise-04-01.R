show(HairEyeColor) # this dataset contains hair color, eye color, and sex for a sample of individuals
# , , Sex = Male
# 
# Eye
# Hair    Brown Blue Hazel Green
# Black    32   11    10     3
# Brown    53   50    25    15
# Red      10   10     7     7
# Blond     3   30     5     8
# 
# , , Sex = Female
# 
# Eye
# Hair    Brown Blue Hazel Green
# Black    36    9     5     2
# Brown    66   34    29    14
# Red      16    7     7     7
# Blond     4   64     5     8

EyeHairFreq = apply(HairEyeColor, c("Eye", "Hair"), sum) # sum over sex, maintaining the Hair and Eye dims
# Hair
# Eye     Black Brown Red Blond
# Brown    68   119  26     7
# Blue     20    84  17    94
# Hazel    15    54  14    10
# Green     5    29  14    16

EyeHairProp = EyeHairFreq / sum(EyeHairFreq) # convert counts to proportions
# Hair
# Eye           Black      Brown        Red      Blond
# Brown 0.114864865 0.20101351 0.04391892 0.01182432
# Blue  0.033783784 0.14189189 0.02871622 0.15878378
# Hazel 0.025337838 0.09121622 0.02364865 0.01689189
# Green 0.008445946 0.04898649 0.02364865 0.02702703

show(round(EyeHairProp, 2)) # round the values in EyeHairProp to 2 decimal places
# Hair
# Eye     Black Brown  Red Blond
# Brown  0.11  0.20 0.04  0.01
# Blue   0.03  0.14 0.03  0.16
# Hazel  0.03  0.09 0.02  0.02
# Green  0.01  0.05 0.02  0.03

HairFreq = apply(HairEyeColor, c("Hair"), sum) # sum over sex and eye, maintaining hair
# Black Brown   Red Blond 
# 108   286    71   127 

HairProp = HairFreq / sum(HairFreq) # convert counts to proportions
# Black     Brown       Red     Blond 
# 0.1824324 0.4831081 0.1199324 0.2145270 

show(round(HairProp, 2)) # round the values in HairProp to 2 decimal places
# Black Brown   Red Blond 
# 0.18  0.48  0.12  0.21 

EyeFreq = apply(HairEyeColor, c("Eye"), sum) # sum over hair and sex, maintaining eye
# Brown  Blue Hazel Green 
# 220   215    93    64 

EyeProp = EyeFreq / sum(EyeFreq) # convert counts to proportions
# Brown      Blue     Hazel     Green 
# 0.3716216 0.3631757 0.1570946 0.1081081 

show(round(EyeProp, 2)) # round the values in EyeProp to 2 decimal places
# Brown  Blue Hazel Green 
# 0.37  0.36  0.16  0.11 

EyeHairProp["Blue",] / EyeProp["Blue"] # compute the conditional hair probabilities given blue eyes
# Black      Brown        Red      Blond 
# 0.09302326 0.39069767 0.07906977 0.43720930 

EyeHairProp["Brown",] / EyeProp["Brown"] # compute the conditional hair probabilities given brown eyes
# Black      Brown        Red      Blond 
# 0.30909091 0.54090909 0.11818182 0.03181818 

EyeHairProp[, "Brown"] / HairProp["Brown"] # compute the conditional eye probabilities given brown hair
# Brown      Blue     Hazel     Green 
# 0.4160839 0.2937063 0.1888112 0.1013986 