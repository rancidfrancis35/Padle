##Packages to parse data: stringr, officer
pacman::p_load(stringr, officer,
               tidyverse, GEOquery, openxlsx, janitor)



#' GSE accession number extractor
#'
#' Extract GSE accession numbers from GEOquery <as .txt file>.
#' @export
parseGSE_txt <- function(file_location){
  text_content <- read_lines(file_location)
  
  accessions <- str_extract_all(text_content, "(?<=Accession: GSE)\\d+")
  accessions <- unlist(accessions)
  vector_with_GSE <- paste("GSE", accessions, sep = "")
  
  return(vector_with_GSE)
  
}

#' GSE accession number extractor
#'
#' Extract GSE accession numbers from GEOquery <as .docx file>.
#' @export
parseGSE_doc <- function(file_location){
  doc <- read_docx(file_location)
  text <- docx_summary(doc)

  # Extracting all occurrences of "GSEXXXXX"
  accessions <- str_extract_all(text, "(?<=Accession: GSE)\\d+")
  # Flatten the list of matches into a single vector
  accessions <- unlist(accessions)
  
  vector_with_GSE <- paste("GSE", accessions, sep = "")
  return(vector_with_GSE)
  
}



