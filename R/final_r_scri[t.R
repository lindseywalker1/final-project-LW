here::here()
setwd("data")
getwd()

# load the music data in 
library(readr)
data1 <- read_csv("/Users/lindseywalker/Documents/Documents/Documents/Documents/RSPH/FALL 2023/EPI590R/final-project-LW/data/top50.csv")

install.packages("gtsummary")
library(gtsummary)

install.packages("dplyr")
library(dbplyr)

music <- data1 |> select(Beats.Per.Minute, Energy, Liveness, Danceability, Valence., Length., Acousticness.., Speechiness., Popularity, Genre)

tbl1 <- tbl_summary(
  music,
  by = Genre,
  label = list(Beats.Per.Minute ~ "Beats/ minute", Valence. ~ "Valence", 
               Length. ~ "Length", Acousticness.. ~ "Acousticness", Speechiness. ~ "Speechiness"),
  statistic = list(
    all_continuous() ~ "{mean}")) |>
  add_p() |>
  modify_header(label ~ "**Characteristic**")  |>
  modify_caption("**Table 1. Music Genre Characteristics**") |>
  modify_spanning_header(c("stat_1", "stat_2", "stat_3", "stat_4", "stat_5", "stat_6", "stat_7", 
                           "stat_8", "stat_9", "stat_10", "stat_11", "stat_12", "stat_13", "stat_14", 
                           "stat_15", "stat_16", "stat_17", "stat_18", "stat_19", "stat_20", "stat_21") 
                         ~ "**Music Genre, n=50**") |>
  add_overall() 
tbl1



descrp <- tbl_summary(
  music,
  by = Genre,
  statistic = list(
    all_continuous() ~ "{mean}")) |>
  add_p() |>
  add_overall() |>
  modify_header(label ~ "**Characteristic**") |>
  modify_caption("**Table 1. Song Characteristics by Genre**") |>
  modify_spanning_header(c("stat_1", "stat_2", "stat_3", "stat_4", "stat_5", "stat_6", "stat_7", 
                           "stat_8", "stat_9", "stat_10", "stat_11", "stat_12", "stat_13", "stat_14", 
                           "stat_15", "stat_16", "stat_17", "stat_18", "stat_19", "stat_20", "stat_21") ~ "**Music Genres**")
descrp

# create linear regression models with Beats per minute as continuous outcome
  # this model: looking at music characteristics that have to do with how 
    #the music is composed: acousticness, speechiness, liveness, length
linear_model <- lm(Beats.Per.Minute ~ Liveness + Acousticness.. + Speechiness. + Length.,
                   data = music)  
tbl_composed <- tbl_regression(
  linear_model,
  intercept = TRUE
)

#this model looks at music characteristics that have to do with how the sound 
    #is interpretted: danceability, popularity, 
linear_model2 <- lm(Beats.Per.Minute ~ Danceability + Popularity + Energy + Valence. + Length.,
                    data = music)
tbl_interp <- tbl_regression(
  linear_model2,
  intercept = TRUE
)

# combined the 2 linear regerssion models and create well formatted regression table
tbl_merge(list(tbl_composed, tbl_interp),
          tab_spanner = c("**Music Composure Model**", "**Music Interpretation Model**"))

# create a figure
hist(music$Beats.Per.Minute)

