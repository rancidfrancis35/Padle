#' GEO accession number accessor
#'
#' Returns accession number of GEO object.
#' @export
source2 <- function(GEO_object){
  df <- GEO_object
  
  return(df[[3]]$geo_accession)
  
}

#' GEO gen_pip_for accessor
#'
#' Returns gen_pip_for of GEO object.
#' @export
gen_pip_for <- function(GEO_object){
  df <- GEO_object
  
  return(list(df[[2]]$data_processing.1, df[[2]]$data_processing.2,
              df[[2]]$data_processing.3))
  
}

#' GEO organism accessor
#'
#' Returns organism of GEO object.
#' @export
organism2 <- function(GEO_object){
  df <- GEO_object
  
  return(df[[2]]$organism_ch1 %>% unique())
  
}


#' GEO tissue accessor
#'
#' Returns tissue of GEO object.
#' @export
tissue <- function(GEO_object){
  df <- GEO_object
  
  return(df[[2]]$source_name_ch1 %>% unique())
  
}

#' GEO journal accessor
#'
#' Returns journal of GEO object.
#' @export
journal <- function(GEO_object){
  df <- GEO_object
  
  if(is.null(df[[3]]$web_link)){
    return("NULL")
  }
  return(df[[3]]$web_link)
  
}

#' GEO pubmedID accessor
#'
#' Returns pubmedID of GEO object.
#' @export
pID <- function(GEO_object){
  df <- GEO_object
  
  return(df[[4]])
}

#' GEO type_mul accessor
#'
#' Returns type_mul of GEO object.
#' @export
type_mul <- function(GEO_object){
  df <- GEO_object
  
  return(df[[2]]$library_strategy %>% unique())
  
}


#' GEO sequencer accessor
#'
#' Returns sequencer of GEO object.
#' @export
sequencer <- function(GEO_object){
  df <- GEO_object
  
  return(df[[2]]$instrument_model %>% unique())
  
}

#' GEO region accessor
#'
#' Returns region of GEO object.
#' @export
region <- function(GEO_object){
  df <- GEO_object
  
  return(df[[2]]$title)
  
}


dataProcessing <- function(GEO_object){
  
  
  
  
  
  
}







#' GEO exp_info accessor
#'
#' Returns exp_info of GEO object.
#' @export
exp_info <- function(GEO_object){
  df <- GEO_object
  
  print("-----------------------------------------------------------------")
  print("##source")
  print(source2(df))
  
  print("##genome_pipeline_format")
  print(gen_pip_for(df))
  
  print("##organism")
  print(organism(df))
  
  print("##tissue")
  print(tissue(df))
  
  print("##journal")
  print(journal(df))
  
  print("##sequencer")
  print(sequencer(df))
  
  print("##type, multiomic")
  print(type_mul(df))
  
  print("##region")
  print(region(df))
  print("-----------------------------------------------------------------")
  
}

#' GEO sum_info accessor
#'
#' Returns exp_info of GEO object, summarised.
#' @export
sum_info <- function(GEO_object){
  df <- GEO_object
  
  print("-----------------------------------------------------------------")
  print("##source##")
  print(source2(df))
  
  print("##genome_pipeline_format##")
  print(paste("1)",gen_pip_for(df)[[1]] %>% unique()))
  print(paste("2)",gen_pip_for(df)[[2]] %>% unique()))
  print(paste("3)",gen_pip_for(df)[[3]] %>% unique()))
  
  
  print("##organism##")
  print(unique(organism(df)))
  
  print("##tissue##")
  print(unique(tissue(df)))
  
  print("##journal##")
  print(journal(df))
  
  print("##pubmed ID##")
  print(pID(df))
  
  print("##sequencer##")
  print(unique(sequencer(df)))
  
  print("##type, multiomic##")
  print(unique(type_mul(df)))
  
  print("##region##")
  print(unique(region(df)))
  print("-----------------------------------------------------------------")
  
}