#' Open a connection to a SQL database, run the query, and close the connection. 
#'
#' @param query A string containing the SQL query
#' @param config A list containing the parameters of the data base connection (driver, host, port, dbname, user, password)
#' @param vector A boolean indicating whether the query should return a a vector that is the first column of a table 
#' @return A data frame containing the results of the redshift query (if vector=FALSE) or a vector containing the first column of the results (if vector=TRUE)
#' @examples
#' config <- list(driver="mydriver.redshift.amazonaws.com", port="5431", dbname="mydbname", user="kristorffeson", password="mYs3curePa33word!")
#' query_redshift('SELECT * FROM mytable', config)

query_db <- function(query, config, vector=F) {
  
  library('RJDBC')
  library('RPostgreSQL')  
  driver <- dbDriver(config[["driver"]]) 
  con <- dbConnect(driver, 
                   host=config[['host']], 
                   port=config[['port']], 
                   dbname=config[["dbname"]], 
                   user=config[["user"]], 
                   password=config[['password']]
  )   
  if(vector) {
    data <- dbGetQuery(con, query)[,1]
    
  } else {
    data <- dbGetQuery(con, query)
    
  }
  dbDisconnect(con)
  
  return(data)
  
}