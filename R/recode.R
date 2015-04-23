recode <- function(f, old, new, asFactor=TRUE){  
  f <- as.character(f)
  for (i in 1:length(old)){
    f[f==old[i]] <- new[i]
  }
  
  if (asFactor) f <- factor(f)  
  
  return(f)
}
