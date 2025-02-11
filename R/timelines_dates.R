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


# generate member crosswalk table framework
cw_member <- NULL
m_id      <- 0 # for iterating through member ids below

for(i_p in cw_pos$pos_id){
  for(i_m in 1:cw_board$board_size[cw_board$board_id == cw_pos$board_id[cw_pos$pos_id == i_p]]){
    
    m_id <- m_id + 1
    
    cw_member <- rbind(cw_member, 
                       data.table(pos_id      = i_p, 
                                  board_id    = cw_board$board_id[cw_board$board_id == cw_pos$board_id[cw_pos$pos_id == i_p]],
                                  member_id   = paste("m", m_id, sep = "", collapse = ""), 
                                  member_name = NA_character_, 
                                  term_begin  = NA_Date_, 
                                  term_end    = NA_Date_,
                                  district_id = NA_character_, 
                                  district_name = NA_character_))
  }
}

rm(i_m, i_p, m_id)


# board membership details----

cw_member[cw_member$board_id == "b01",]$member_name <- c("chavez", "umstead", "carda-auten", 
                                                         "beyer", "tabb", "rogers", "goff")
cw_member[cw_member$board_id == "b01",]$district_name <- c(paste("district", 1:4, 
                                                               sep = " "),
                                                         "consolidated A", "consolidated B",
                                                         "at large")

cw_member[cw_member$board_id == "b02",]$member_name <- c("williams", "middleton", "Baker",
                                                         "caballero", "cook", "freeman", "rist")
cw_member[cw_member$board_id == "b02",]$district_name <- c("mayor", "ward 2", "at large", 
                                                         "at large", "ward 3", "ward 1", "at large")

cw_member[cw_member$board_id == "b03",]$member_name <- c("allam", "lee", "burton", 
                                                         "jacobs", "valentine")
cw_member[cw_member$board_id == "b03",]$district_name <- "at large"


cw_districts <- cw_member %>%
  group_by(board_id, district_name) %>%
  summarise(district_id = NA_character_) %>%
  ungroup() %>%
  mutate(., 
         district_id = paste("d", 1:nrow(.), sep = "_"))



