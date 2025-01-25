library(renv)
library(dplyr)
library(lubridate)
library(ggplot2)
library(janitor)
library(data.table)

renv::status()
renv::snapshot()

# https://docs.google.com/document/d/1h0IvE_gZJcas2t_86wU52fi0b9Bf354UxSzy9bwsYuE/edit?tab=t.0


cw_pos <- data.frame(pos_id = c(NA), 
                     name = c(NA), 
                     agcy = c(NA))

