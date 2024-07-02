#' Creates "rows"
#'
#' Returns important info of GEO object as a vector, for compilation into a data frame. Modify to suite your needs.
#' @export
row_creator <- function(GSE_object){
  #no reason for this
  list_of_data <- GSE_object
  
  org <-  paste(organism2(list_of_data), collapse = ",")
  tissue <-  paste(tissue(list_of_data), collapse = ",")
  sequencer <-  paste(sequencer(list_of_data), collapse = ",")
  typ <-  paste(type_mul(list_of_data), collapse = ",")
  
  genPipFor <- gen_pip_for(GSE_object)
  genome <- paste(genPipFor[[1]] %>% unique(), collapse = ",")
  pipeline <- paste(genPipFor[[2]] %>% unique(), collapse = ",")
  format <- paste(genPipFor[[3]] %>% unique(), collapse = ",")
  
  
  ##combines everything into 1 "row"
  toReturn <- c(source2(list_of_data),journal(list_of_data),
                org,tissue,sequencer,typ, pID(list_of_data),
                genome, pipeline, format) 
  
  
  return(toReturn)
  
}

#' GSE in global environment to df
#'
#' Creates a data frame of important information of all the studies compiled, for further processing/export.
#' @export
gse_as_df <- function(){
  #finds objects in global env starting with GSE
  allGSE <- ls(envir = .GlobalEnv)  
  gse_objects <- allGSE[grep("^GSE", allGSE)] 
  
  #saves all of them into dataframe
  gEnvData <- mget(gse_objects, envir = .GlobalEnv)
  dframe <- lapply(gEnvData, row_creator) %>% data.frame()
  
  #dataframe formatting
  dframe <- t(dframe)
  colnames(dframe) <- c("source","journal",
                         "organism","tissue","sequencer","-omic", "pubmedID",
                         "genome", "pipeline", "format")
  
  return (dframe)
  
}


##can just use write.xlsx to export to excel
