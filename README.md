# minutiaer

...or, a collection of small things that will make me happier.

---

## Including:


### string interpolation

No more paste0 nonse. This is a simple string interpolation à la shell, ruby, Scala...

```r
library(devtools)
install_github("dterror/minutiaer")
core_table <- "table_name"
dbRunQuery(s("select * from ${core_table} limit 10"))
```

**current dev state:** mm, it might need a bit more R wizardry, but for now it's good enough. It is recursive, so be careful. Just be careful in general.
