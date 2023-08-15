# I copied parts of the readme file downloaded from tidytuesday
# https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-01-31/readme.md?plain=1

# Read in with tidytuesdayR package to load the readme and all the datasets for the week of interest
install.packages("tidytuesdayR")

# Either ISO-8601 date or year/week works! 
# Using week of Jan 31, 2023

tuesdata <- tidytuesdayR::tt_load('2023-01-31')
tuesdata <- tidytuesdayR::tt_load(2023, week = 5)

cats_uk <- tuesdata$cats_uk
cats_uk_reference <- tuesdata$cats_uk_reference

