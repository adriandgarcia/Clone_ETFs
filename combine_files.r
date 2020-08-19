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


#ETFS
Data1 <- READ("~/Data/Clone_ETFs/ETFs/MS_ETFS_081820_2417.csv")

write_csv(Data1, "~/Data/Clone_ETFs/ETFs/MS_ETFS_081820_Full.csv")

rm(list=c("Data1","READ"))
