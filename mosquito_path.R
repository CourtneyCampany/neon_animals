pathology <- read.csv("raw_data/mosq_path/stackedFiles/mos_pathogenresults.csv")

#simplify raw dataset
pathology_short <- pathology[, c("domainID", "siteID",'endCollectDate' ,
                                 'testMethod','testResult','testPathogenName',
                                 'taxonID', 'finalResult')]
  pathology_short$date <- stringr::str_sub(pathology_short$endCollectDate, end=10)
  pathology_short$date <- as.Date(pathology_short$date)
  
library(dplyr)
pathogen_presence <- dplyr::distinct_at(pathology_short, 
                     vars('siteID','testResult','testPathogenName','taxonID',
                          'finalResult'))

write.csv(pathogen_presence, "module_data/mosquito_pathogens.csv")
