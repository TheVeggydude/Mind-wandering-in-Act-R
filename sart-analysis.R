##
## SART model analysis
## Cognitive Science Practical 2018
##


##-----------------------------------##
## Question 2: Running an experiment ##
##-----------------------------------##


# Read in the data
data_path <- "~/output/" # Change to the location of your output folder

# List of the data files
behfiles <- list.files(path = data_path, pattern=".csv", full.names = TRUE)

# Combine all data files into a single data frame (behdat)
behdat <- data.frame()
for (i in 1:length(behfiles)) {
  behdat <- rbind(behdat, read.csv(behfiles[i], sep = ",", strip.white = TRUE))
}


## Analysis

# What is the mean response accuracy, and what is the standard error of the mean? Aggregate within and then across participants.


# Plot a histogram of response time for participant 1


# What is the mean response time and standard error? Aggregate within and then across participants.




##---------------------------------------##
## Question 3: Analysing the model trace ##
##---------------------------------------##

## The easiest way to do this is to read the trace file line by line wihle keeping track of the state of the model

library(stringr)
library(data.table)

# Read the trace file into memory
trace <- file(paste0(data_path, "sart-trace.txt"), "r")
lines <- readLines(trace)

participant <- 0L
time <- 1
n <- length(lines)
activations <- data.table(participant = rep(0L, n), time = rep(0, n), activation = rep(0, n)) # Preallocate a data.table where we can store ATTEND activation values
idx <- 0L


for(i in 1:length(lines)) {

  # Read a single line
  line <- lines[i]
  
  # Detect the start of a new model run
  if(str_detect(line, "Run \\d+")) {
    participant <- participant + 1L
    print(participant)
  }
  
  # Check whether the line contains the activation of the ATTEND chunk, and then store the value
  # Hints:
  #   - you can use str_detect() and str_extract(). See http://stringr.tidyverse.org/
  #   - use regular expressions to describe string patterns. A good resource is https://regexr.com/ 
  #   - you will also need to keep track of the time, which is given at the start of many (but not all!) lines in the trace file. 
  #   - you can add a line to the activations data.table using set(activations, idx, j = 1:3, value = list(participant, time, activation)). See ?set for more information.

}


# You should now have a data.table containing each observation of the activation of ATTEND for all 25 model runs, along with the time of the observation.
# Since the observations were not all made at exactly the same time for each participant, and the number of observations differs between participants,
# we have to bin the measurements (e.g. in 1-second bins) before we can calculate the average activation over time across participants.

# Create a plot of mean activation of the ATTEND chunk over time, averaged across participants.

# Create another plot in which you apply smoothing, so that it is easier to see if there is a trend in the data.