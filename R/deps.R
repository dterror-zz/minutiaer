is_package_installed <- function(package) package %in% rownames(installed.packages())

cat(paste("Installing new packages in the libpath: \n", .libPaths()), '\n')

# install devtools
options(repos="http://cran.utstat.utoronto.ca")
if(!is_package_installed('devtools')){
  install.packages("devtools")  
}
library(devtools)

# read dependencies.txt
packages <- scan('dependencies.txt', what="character")

# for each package in the list, do one of the following: install_github, install.packages, or install_version
for (package in packages){
  cat(paste('Checking package', package, '[', match(package, packages), 'of', length(packages), '] \n \n ============================ \n \n' ))
  # check if package exists
  if(is_package_installed(package)){
    next  
  } else if (length(grep('github', package))>0){
    full_url <- unlist(strsplit(package, '/'))    
    package_url <- paste(full_url[2], full_url[3], sep='/')
    devtools::install_github(package_url)    
  } else if (length(grep(',', package))>0){
    name_and_version <- unlist(strsplit(package, split=','))
    devtools::install_version(name_and_version[1], name_and_version[2])      
  } else{
    install.packages(package)
  }  
}
