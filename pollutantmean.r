pollutantmean <- function(directory, pollutant, id=1:332) {
  filenames <- paste(directory, paste(sprintf("%03d", id),"csv", sep="."), sep = "/")
  alldata <- do.call(rbind,lapply(filenames,read.csv))
  clear_pollutant <- alldata[!is.na(alldata[[pollutant]]),pollutant]
  mean(clear_pollutant)
}

#pollutantmean("specdata", "sulfate", 1:10)
#pollutantmean("specdata", "nitrate", 70:72)
#pollutantmean("specdata", "nitrate", 23)

complete <- function(directory, id = 1:332) {
  filenames <- paste(directory, paste(sprintf("%03d", id),"csv", sep="."), sep = "/")
  alldata <- do.call(rbind,lapply(filenames,read.csv))
  alldata_clear <- alldata[complete.cases(alldata),]
  df <- data.frame(table(alldata_clear$ID))
  names(df)[1]<-"id"
  names(df)[2]<-"nobs"
  df
}

#print(complete("specdata", 1))
#complete("specdata", c(2, 4, 8, 10, 12))
#complete("specdata", 30:25)
#complete("specdata", 3)