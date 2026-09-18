library(readxl)
rahvaarv <- read_excel("data/Rahvaarv.xlsx")
synnid <- read_excel("data/Elussündinud.xlsx")
surmad <- read_excel("data/Surnud.xlsx")

demograafia <- rahvaarv %>% 
  full_join(synnid) %>% 
  full_join(surmad)

demograafia <- demograafia %>% 
  mutate(surnute_arv = ifelse(kov == "Alutaguse vald", "89,0", surnute_arv))

write_excel_csv(demograafia, "data/demo.csv")
