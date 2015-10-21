read_file <- function() {
        # check if file exist and download if not
        filename <- list.files(pattern = "^.*galaxy.zip")[1]
        if (!file.exists(filename)) {
                url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                dateDownloaded <- gsub(":", "-", gsub(" ", "", date())) # remove spaces
                download.file(url, destfile=paste(dateDownloaded, "galaxy.zip", sep=""), method="curl")
        }

        # unzip if not already done
        filename <- list.files(pattern = "^.*galaxy.zip")[1]
        if (!dir.exists("UCI HAR Dataset")) {
                unzip(filename)
        }
}
