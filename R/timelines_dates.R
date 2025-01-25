library(renv)
library(dplyr)
library(lubridate)
library(ggplot2)
library(janitor)
library(data.table)

renv::status()
renv::snapshot()

rm(list=ls());cat('\f');gc()


# https://docs.google.com/document/d/1h0IvE_gZJcas2t_86wU52fi0b9Bf354UxSzy9bwsYuE/edit?tab=t.0


# build data----
cw_pos <- data.table(pos_id        = factor(c("p01", "p02")), 
                     position_name = c("School Board Member", "City Council Member"), 
                     agency_name   = c("Durham Public Schools", "City of Durham"))

cw_agency <- data.table(agency_id   = factor(c("a01", "a02")), 
                        agency_name = c("Durham Public Schools", "City of Durham"), 
                        agency_abbr = c("DPS"))

