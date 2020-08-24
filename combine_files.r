library(tidyverse)
library(lubridate)

READ <- function(FILE, OUTPUT) {
  read_csv(FILE,
           trim_ws = TRUE,
           guess_max = nrow(read_csv(FILE)) -12,
           n_max = nrow(read_csv(FILE)) -12,
           col_types = cols(
             ISIN = col_character(),
             `Strategic Beta Group` = col_character(),
             `Index Selection` = col_character(),
             `Index Weighting` = col_character()
           )
  )
}

#Mutual Funds
Data1 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_081820_5000.csv")
Data2 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_081820_10000.csv")
Data3 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_081820_15000.csv")
Data4 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_081820_20000.csv")
Data5 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_081820_25000.csv")
Data6 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_081820_25264.csv")

Full_DATA <- full_join(Data1, Data2) %>%
  full_join(., Data3) %>% 
  full_join(., Data4) %>% 
  full_join(., Data5) %>% 
  full_join(., Data6)


write_csv(Full_DATA, "~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_081820_Full.csv")

rm(list=c("Data1","Data2","Data3","Data4","Data5","Data6","Full_DATA"))

#Mutual Funds ASSets
Data1 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_082020_5000.csv")
Data2 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_082020_10000.csv")
Data3 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_082020_15000.csv")
Data4 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_082020_20000.csv")
Data5 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_082020_25000.csv")
Data6 <- READ("~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_082020_25290.csv")

Full_DATA <- full_join(Data1, Data2) %>%
  full_join(., Data3) %>% 
  full_join(., Data4) %>% 
  full_join(., Data5) %>% 
  full_join(., Data6)


write_csv(Full_DATA, "~/Data/Clone_ETFs/Mutual_Funds/MS_MFS_082020_Full.csv")

rm(list=c("Data1","Data2","Data3","Data4","Data5","Data6","Full_DATA"))

#ETFS
Data1 <- READ("~/Data/Clone_ETFs/ETFs/MS_ETFS_082020_2420.csv")

write_csv(Data1, "~/Data/Clone_ETFs/ETFs/MS_ETFS_082020_Full.csv")

rm(list=c("Data1"))

#ETFS ASSETS

Data1 <- READ("~/Data/Clone_ETFs/ETFs/MS_ETFSFLOW_082020_2420.csv")
write_csv(Data1, "~/Data/Clone_ETFs/ETFs/MS_ETFSFLOW_082020_Full.csv")

rm(list=c("Data1", "READ"))

# a <- read_csv("~/Data/Clone_ETFs/ETFs/MS_ETFSFLOWS_082020_Full.csv",
#               skip = 7,
#               n_max = nrow(read_csv("~/Data/Clone_ETFs/ETFs/MS_ETFSFLOWS_082020_Full.csv")) - 2
#               ) %>% 
#   rename_all(make.names)
