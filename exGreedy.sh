#!/bin/sh

## PREPARATION ##
# make clean
make 

## PARAMETER TESTER ##
# Solve son istance and allow the user to set the parameters
#
# Example of command line:
#   ./ *.exe [map] [paramToTest] [from] [to] [increment] [otherParam1] [otherParam2] [otherParam3] ...
#   Usage:
#       - [map] -> 0 to select all the maps
#       - if [paramToTest] is "maxDeviation" , then [otherparam1] is "wProfit", [otherParam2] is "wTime", [otherParam3] is "wNonCost" ... 

./MainParamGr.exe 0 wProfit 0.1 5.0 0.1 1.0 1.0 0.0 
./MainParamGr.exe 0 wTime 0.1 5.0 0.1 1.0 1.5 0.0
./MainParamGr.exe 0 maxDeviation 0.01 10.0 0.01 1.0 0.7 0.0
./MainParamGr.exe 0 wNonCost 0.0 5.0 0.1 1.0 0.7 1.5

# ./MainParamGr.exe 1 wProfit 0.5 2.0 0.5 1.0 1.0 1.0 
# ./MainParamGr.exe 1 wTime 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 1 maxDeviation 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 1 wNonCost 0.5 2.0 0.5 1.0 1.0 1.0

# ./MainParamGr.exe 2 wProfit 0.5 2.0 0.5 1.0 1.0 1.0 
# ./MainParamGr.exe 2 wTime 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 2 maxDeviation 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 2 wNonCost 0.5 2.0 0.5 1.0 1.0 1.0

# ./MainParamGr.exe 3 wProfit 0.5 2.0 0.5 1.0 1.0 1.0 
# ./MainParamGr.exe 3 wTime 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 3 maxDeviation 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 3 wNonCost 0.5 2.0 0.5 1.0 1.0 1.0

# ./MainParamGr.exe 4 wProfit 0.5 2.0 0.5 1.0 1.0 1.0 
# ./MainParamGr.exe 4 wTime 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 4 maxDeviation 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 4 wNonCost 0.5 2.0 0.5 1.0 1.0 1.0

# ./MainParamGr.exe 5 wProfit 0.5 2.0 0.5 1.0 1.0 1.0 
# ./MainParamGr.exe 5 wTime 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 5 maxDeviation 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 5 wNonCost 0.5 2.0 0.5 1.0 1.0 1.0

# ./MainParamGr.exe 6 wProfit 0.5 2.0 0.5 1.0 1.0 1.0 
# ./MainParamGr.exe 6 wTime 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 6 maxDeviation 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 6 wNonCost 0.5 2.0 0.5 1.0 1.0 1.0

# ./MainParamGr.exe 7 wProfit 0.5 2.0 0.5 1.0 1.0 1.0 
# ./MainParamGr.exe 7 wTime 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 7 maxDeviation 0.5 2.0 0.5 1.0 1.0 1.0
# ./MainParamGr.exe 7 wNonCost 0.5 2.0 0.5 1.0 1.0 1.0

## PLOT THE DATA ##
# plot with python script the variation of parameter calculated above

python3 ./scriptHelpers/plotParams.py 0 wProfit
python3 ./scriptHelpers/plotParams.py 0 wTime
python3 ./scriptHelpers/plotParams.py 0 maxDeviation
python3 ./scriptHelpers/plotParams.py 0 wNonCost

# python3 ./scriptHelpers/plotParams.py 1 wProfit
# python3 ./scriptHelpers/plotParams.py 1 wTime
# python3 ./scriptHelpers/plotParams.py 1 maxDeviation
# python3 ./scriptHelpers/plotParams.py 1 wNonCost

# python3 ./scriptHelpers/plotParams.py 2 wProfit
# python3 ./scriptHelpers/plotParams.py 2 wTime
# python3 ./scriptHelpers/plotParams.py 2 maxDeviation
# python3 ./scriptHelpers/plotParams.py 2 wNonCost

# python3 ./scriptHelpers/plotParams.py 3 wProfit
# python3 ./scriptHelpers/plotParams.py 3 wTime
# python3 ./scriptHelpers/plotParams.py 3 maxDeviation
# python3 ./scriptHelpers/plotParams.py 3 wNonCost

# python3 ./scriptHelpers/plotParams.py 4 wProfit
# python3 ./scriptHelpers/plotParams.py 4 wTime
# python3 ./scriptHelpers/plotParams.py 4 maxDeviation
# python3 ./scriptHelpers/plotParams.py 4 wNonCost

# python3 ./scriptHelpers/plotParams.py 5 wProfit
# python3 ./scriptHelpers/plotParams.py 5 wTime
# python3 ./scriptHelpers/plotParams.py 5 maxDeviation
# python3 ./scriptHelpers/plotParams.py 5 wNonCost

# python3 ./scriptHelpers/plotParams.py 6 wProfit
# python3 ./scriptHelpers/plotParams.py 6 wTime
# python3 ./scriptHelpers/plotParams.py 6 maxDeviation
# python3 ./scriptHelpers/plotParams.py 6 wNonCost

# python3 ./scriptHelpers/plotParams.py 7 wProfit
# python3 ./scriptHelpers/plotParams.py 7 wTime
# python3 ./scriptHelpers/plotParams.py 7 maxDeviation
# python3 ./scriptHelpers/plotParams.py 7 wNonCost

## PARAMETER MAXDEVIATION SCALER ## 

# ./MainMapGr.exe

# ## EXECUTE ALL ISTANCES ## 
# # Solve all istances and with the specified parameters and print the results

# # Version 1 : with default parameters #
# ./MainGreedy.exe 1

# # ersion 2 : with readed parameters range #
# ./MainGreedy.exe 2