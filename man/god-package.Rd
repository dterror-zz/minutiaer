\name{god-package}
\alias{god-package}
\alias{god}
\docType{package}
\title{
god: Little things that make life easier/happier
}
\description{
god... is in the details.
This is supposed to be a collection of small-ish things that make a difference
}
\details{
\tabular{ll}{
Package: \tab god\cr
Type: \tab Package\cr
Version: \tab 0.1.0\cr
Date: \tab 2014-11-30\cr
License: \tab The MIT License (MIT)\cr
}
- simple string interpolation with s method
}
\author{
Diogo Terror

Maintainer: Diogo Terror <me@diogoterror.com>
}
\references{
...
}
\keyword{ utilities interpolation }
\seealso{
http://youtu.be/Du_RTMmofWM?list=UUBLWQPtBLAxq0xym5Ni5QVQ
}
\examples{
tableName <- "core_table"
dbRunQuery(s("select * from ${core_table} limit 10"))
}
