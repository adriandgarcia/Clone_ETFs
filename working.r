a1 <- TEST %>% 
  select(Name,Group)
  
a <- left_join(MF_2017, a1) %>% 
  group_by(Group) %>% 
  mutate(., SS = sum(Estimated.Share.Class.Net.Flow..Yearly...Year2019..USD, na.rm = TRUE)) %>% 
  filter(SS < 0)

ETF_2017 <- ETFs_Flows %>% 
  filter(
    Inception..Date <= "2017-08-01"
  ) %>% 
  mutate(
    Flows_SixMo2020 = rowSums(.[, 11:16], na.rm = TRUE),
    Assets_2017 = rowSums(.[, 18:29], na.rm = TRUE),
    Assets_2018 = rowSums(.[, 30:41], na.rm = TRUE),
    Assets_2019 = rowSums(.[, 42:53], na.rm = TRUE),
    Assets_SixMo2020 = rowSums(.[, 54:59], na.rm = TRUE)) %>% 
  select(
    1:6,
    7:10,
    61:65,
    everything()
  )

Sum_ETF2017 <- ETF_2017 %>% 
  summarise(
    Flows_2017 = sum(Estimated.Share.Class.Net.Flow..Yearly...Year2017..USD, na.rm = TRUE),
    Flows_2018 = sum(Estimated.Share.Class.Net.Flow..Yearly...Year2018..USD, na.rm = TRUE),
    Flows_2019 = sum(Estimated.Share.Class.Net.Flow..Yearly...Year2019..USD, na.rm = TRUE),
    Flows_SixMo2020 = sum(Flows_SixMo2020),
    Assets_2017 = sum(Assets_2017),
    Assets_2018 = sum(Assets_2018),
    Assets_2019 = sum(Assets_2019),
    Assets_SixMo2020 = sum(Assets_SixMo2020)
  )


MF_2017

TEST <- full_join(NameMod_df, Strat_df) 

TESTKEY <- TEST %>% 
  filter(
    Name %in% ETF_2017$Name
  )

TESTKEY2 <- TEST %>% 
  filter(
    Group %in% TESTKEY$Group,
    TYPE2 == "MUTUAL FUND"
  ) 

MF_2017 <- Data_Assets %>% 
  filter(
    Name %in% TESTKEY2$Name,
  ) %>% 
  mutate(
    Flows_SixMo2020 = rowSums(.[, 11:16], na.rm = TRUE),
    Assets_2017 = rowSums(.[, 18:29], na.rm = TRUE),
    Assets_2018 = rowSums(.[, 30:41], na.rm = TRUE),
    Assets_2019 = rowSums(.[, 42:53], na.rm = TRUE),
    Assets_SixMo2020 = rowSums(.[, 54:59], na.rm = TRUE)) %>% 
  select(
    1:6,
    7:10,
    61:65,
    everything()
  )

Sum_MF2017 <- MF_2017 %>% 
  summarise(
    Flows_2017 = sum(Estimated.Share.Class.Net.Flow..Yearly...Year2017..USD, na.rm = TRUE),
    Flows_2018 = sum(Estimated.Share.Class.Net.Flow..Yearly...Year2018..USD, na.rm = TRUE),
    Flows_2019 = sum(Estimated.Share.Class.Net.Flow..Yearly...Year2019..USD, na.rm = TRUE),
    Flows_SixMo2020 = sum(Flows_SixMo2020),
    Assets_2017 = sum(Assets_2017),
    Assets_2018 = sum(Assets_2018),
    Assets_2019 = sum(Assets_2019),
    Assets_SixMo2020 = sum(Assets_SixMo2020)
  )

write_csv(ETF_2017, "AA.csv")
write_csv(MF_2017, "BB.csv")
write_csv(TEST, "CC.csv")
