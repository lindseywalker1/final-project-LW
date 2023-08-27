here::here() 
#output: "/Users/lindseywalker/Documents/Documents/Documents/Documents/RSPH/FALL 2023/EPI590R/final-project-LW"

setwd("data") 
getwd()
#output: "/Users/lindseywalker/Documents/Documents/Documents/Documents/RSPH/FALL 2023/EPI590R/final-project-LW/data"

df_cats <- read.csv("cats_uk_reference.csv", header=TRUE)

library(gtsummary)

tbl_summary(
  df_cats,
  by = animal_sex,
  include = c(hunt, prey_p_month, animal_reproductive_condition,
              hrs_indoors, n_cats, food_dry, food_wet, age_years), 
  missing = "no" |>
  add_p(prey_p_month ~ "t.test")
  
)
