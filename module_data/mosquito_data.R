
taxon <- read.csv("raw_data/mosquito_data/stackedFiles/mos_expertTaxonomistIDProcessed.csv")

#simplify raw dataset
taxon_short <- taxon[, c("domainID", "siteID", "plotID", "collectDate",
                         'kingdom',	'phylum',	'class'	,'order',	'family',
                         'subfamily',	'tribe',	'genus','scientificName',
                         'nativeStatusCode', 'sex')]

  taxon_short$date <- stringr::str_sub(taxon_short$collectDate, end=10)
  taxon_short$date <- as.Date(taxon_short$date)

library(dplyr)
mosquito_presence <- dplyr::distinct_at(taxon_short, 
              vars('siteID','scientificName','nativeStatusCode','scientificName'))


write.csv(mosquito_presence, "module_data/mosquito_taxonomy.csv",
          row.names = FALSE)

