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
cw_pos    <- data.table(pos_id        = (c("p01", "p02", "p03")), 
                        position_name = c("School Board Member", 
                                          "City Council Member", 
                                          "County Commissioner"), 
                        board_id      = c("b01", "b02", "b03"))

cw_board <- data.table(board_id         = (c("b01", "b02", "b03")), 
                       board_name       = c("Durham Public Schools Board of Education", 
                                            "Durham City Council", 
                                            "Durham County Commissioners"), 
                       board_size       = c(7,7,5), 
                       board_abbr       = c("DPS_boe", "DUR_cc", "DCO_bocc"),
                       appointment_type = c("elected", "elected", "elected"), 
                       term_months      = c(NA_integer_), 
                       min_age          = c(NA, NA, 21))

cw_member <- NULL

for(i_p in cw_pos$pos_id){
  print(i_p)
}


cw_pos
cw_board
