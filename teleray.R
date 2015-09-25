as.list.teleray=function(row) {loc=row$location;row$location<-NULL;c(unlist(row),list(lon=loc[[1]],lat=loc[[2]]))}

library(RJSONIO)

teleray = function() {
  measure=fromJSON(readLines("http://teleray.irsn.fr/TelerayService/service/measure"))
  measure.list=lapply(measure,as.list.teleray)
  do.call(rbind.data.frame, measure.list)
}
