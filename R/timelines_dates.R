library(renv)
library(dplyr)
library(lubridate)
library(ggplot2)
library(janitor)
library(data.table)

renv::status()
renv::snapshot()

# https://docs.google.com/document/d/1h0IvE_gZJcas2t_86wU52fi0b9Bf354UxSzy9bwsYuE/edit?tab=t.0


# build data----
cw_pos <- data.frame(pos_id   = c(nafill()), 
                     position = c(NA), 
                     agency   = c(NA))


# x = 1:10
# x
# x[c(1:2, 5:6, 9:10)] = NA
# x
# nafill(x    = x, 
#        type = "locf")
# nafill(x    = x, 
#        type = "nocb")
# 
# args(nafill)
# 
# dt = data.table(v1=x, v2=shift(x)/2, v3=shift(x, -1L)/2)
# dt
# nafill(dt, "nocb")
# 
# setnafill(dt, "locf", cols=c("v2","v3"))
# dt
# 
# ?shift
# 
# x <- 1:5
# x
# shift(x, n = 1, fill = NA, type = "lag")
# 
# shift(x, n = 1:2, fill = 0, type = "lag")
# 
# shift(x, n = -1:1)
# shift(x, n = -1:1, type = "shift", give.names = T)
# shift(x, n = -1:1, type = "cyclic")
