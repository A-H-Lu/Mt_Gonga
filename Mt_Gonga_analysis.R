## Loading files ####

library(readxl)
library(tidyverse)
data_L <- read_excel("biomass2015.xls", sheet = 1)
data_M <- read_excel("biomass2015.xls", sheet = 2)
data_A <- read_excel("biomass2015.xls", sheet = 3)
data_H <- read_excel("biomass2015.xls", sheet = 4)



file <- "biomass2015.xls"
excel_sheets(path = file)

my_data <- read_excel(path = file, sheet = "L")

Site_A <- read_excel("R/BIO302/biomass2015.xls", 
                     +     sheet = "Site A")

#Plotting data ####

SL_df <- 
  Site_L %>% 
  group_by(plot) %>% 
  summarise(total_production_L = sum(production, na.rm = T))%>% 
  ungroup()

View(SL_df)

SA_df <-
  Site_A %>%
  group_by(plot) %>%
  summarise(total_production_A = sum(production, na.rm = T))%>% 
  ungroup()

View(SA_df)

SH_df <-
  Site_H %>%
  group_by(plot) %>%
  summarise(total_production_H = sum(production, na.rm = T))%>% 
  ungroup()

View(SH_df)

SM_df <-
  Site_M %>%
  group_by(plot) %>%
  summarise(total_production_M = sum(production, na.rm = T))%>% 
  ungroup()

View(SM_df)

#example code

mergedata_L_df <- 
  data_L %>% 
  group_by(plot) %>% 
  summarise(total_production = sum(production, na.rm = T)) %>% 
  ungroup()


#### another solution ####

#getting the data
biomass2015 <- ("C:/Users/anne1/Documents/R/BIO302/biomass2015.xls")
biomass <- excel_sheets(biomass2015) %>%
  purrr::map_df(~ read_excel(biomass2015, sheet = .x))

#keeping the important columns
biomass.df <- biomass %>%
  select(c(site, plot, production)) %>%
  dplyr::mutate(site = factor
                (site, levels = c("L", "M", "A", "H"))) %>%
  group_by(site, plot) %>%
  summarise(Biomass = sum(production, na.rm = T))


biomass.plot <- ggplot() +
  geom_boxplot()

use_git()





