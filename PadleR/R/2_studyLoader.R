#' String to vector converter
#'
#' Returns a string of GSE accession numbers as a vector, for processing.
#' @export
string_to_vector <- function(GSE_string){
  combined_string <- GSE_string
  vector <- unlist(strsplit(combined_string, ", "))
  return(vector)
}



#' process GEO data
#'
#' process GEO data by extracting crucial info and unpacks them into global environment.
#' @export
process_GEO_data <- function(GSE_vector) {
  result_list <- list()
  
  for (i in GSE_vector) {
    df <- getGEO(i)
    
    if (length(df) == 1) {
      object <- df[[1]]
      result_list[[i]] <- list(dims(object), pData(object), notes(object), pubMedIds(object), annotation(object), protocolData(object))
    } 
    else {
      for (j in 1:length(df)) {
        object <- df[[j]]
        new_name <- paste0(i, "_", j)
        result_list[[new_name]] <- list(dims(object), pData(object), notes(object), pubMedIds(object), annotation(object), protocolData(object))
      }
    }
  }
  list2env(result_list, envir = .GlobalEnv)
  
  Sys.sleep(2) 
  ##remove everything else
  objects <- ls(envir = .GlobalEnv)
  objects_to_remove <- objects[!grepl("^GSE", objects)]
  rm(list = objects_to_remove, envir = .GlobalEnv)
  
  print('--Imporant information from studies stored in global env.--')
  
  return()
}


