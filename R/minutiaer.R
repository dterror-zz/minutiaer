#' Creates a String with interpolated values
#' 
#' @param text A string
#' @return The text string with the substituted interpolated variabled
#' @examples
#' name <- "Kristorffeson"
#' greetin <- s("Hi there, ${name}")
#' # => "Hi there, Kristorffeson"
s <- function(text, envir=parent.frame()) {
  # We grab the parent context (or the explicitly specified one)
  # extract on match at a time (recursively) and
  # try to get the refering variable from the environment
  # if that's no possible, we return the original error
  # i.e "object 'x' not found
  pattern <- '(\\$\\{\\w+\\})'
  match_data <- regexpr(pattern=pattern, text=text)
  if (match_data[1] != -1) {
    match <- regmatches(text, match_data)
    key <- gsub('[\\$\\{\\}]', x=match, replacement="")
    tryCatch({
      val <- get(key, envir=envir)
    }, error=function(err){
      stop("object '", key, "' not found", call. = F)
    })
    regmatches(text, match_data) <- c(val)
    return(s(text, envir))
  } else {
    return(text)
  }
}
