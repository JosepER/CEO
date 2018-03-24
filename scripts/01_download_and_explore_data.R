# Download and explore data

library(here)
library(haven)
library(magrittr)
library(tidyverse)

#http://ceo.gencat.cat/ca/barometre/detall/index.html?id=6408
#http://ceo.gencat.cat/ca/barometre/matrius-fusionada-BOP/

# Import data ----

## Dowlnoad and unzip raw files ---- 

if(!file.exists(here("data", "from_CEO", "survey_data_863.csv"))){

download.file("http://upceo.ceo.gencat.cat/wsceop/6408/Microdades%20anonimitzades%20cine-863%20%20csv.csv", 
              here("data", "from_CEO", "survey_data_863.csv"))

}


if(!file.exists(here("data", "from_CEO", "survey_data_all_since_2014.rar"))){
  
  download.file("http://ceo.gencat.cat/web/.content/20_barometre/Matrius_BOP/2014_Microdades_anonimitzades_fusio_cine_pres.rar", 
                here("data", "from_CEO", "survey_data_all_since_2014.rar"))
  
  #I had to manually decompress the file. 
}


# Read data ----

if(!file.exists(here("data", "survey_data_863.rds"))){

data_863 <- read_delim(here("data", "from_CEO", "survey_data_863.csv"), delim = ";")

data_863 %>%
  write_rds(here("data", "survey_data_863.rds"))

}else{
  
  data_863 <- read_rds(here("data", "survey_data_863.rds"))
  
}

if(!file.exists(here("data", "Microdades anonimitzades fusio cine pres.rds"))){

data_all_surveys <- read_sav(here("data", "from_CEO",
                                  "Microdades anonimitzades fusio cine pres.sav"))

data_all_surveys %>%
  write_rds(here("data", "Microdades anonimitzades fusio cine pres.rds"))

}else{
  
  data_all_surveys <- read_rds(here("data", "Microdades anonimitzades fusio cine pres.rds"))
  
}

  ## Subset 

data_863_labelled <- data_all_surveys %>%
  filter(BOP_NUM == 42)

# Map variables to labels ----

data_frame()





