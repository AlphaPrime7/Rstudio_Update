# Using installr for R
install.packages('installr')
library(installr)
updateR()

# Updating R studio
# 1.
# Visit the Help > About RStudio > Check version
# Navigate to https://posit.co/download/rstudio-desktop/ ; crosscheck version above to site version
# if installed version is deprecated proceed below:

#2.
# Download the latest Rstudio version
# Unless you are a cave man run the installation.
# Found this function and will try it next time for inplace installation.

# Some date manipulation (Thought i will need it for grep but did NOT)

#Floor date gives the first md of the year
as.POSIXct(paste0(substr(Sys.Date(),1,4),"-01-01"))
lubridate::floor_date(Sys.Date(), unit = "years")

#Extracting year
currdate = as.Date(Sys.Date())
curryear = format(as.Date(currdate, format="%d/%m/%Y"),"%Y")
curryear = as.numeric(curryear)

currdate = as.Date(Sys.Date())
currdateform = format(currdate, format="%m/%d/%Y")
curryear <- year(mdy(currdateform))
curryear = as.numeric(curryear)

install.RStudio  <- function(page_with_download_url, ...) {

  if(missing(page_with_download_url)) page_with_download_url <- "https://posit.co/download/rstudio-desktop/"
  # get download URL:
  page <- readLines(page_with_download_url, warn = FALSE)

  #https://posit.co/download/rstudio-desktop/

  pat <- "https://posit.co/[\\w]/rstudio-desktop/[\\w]-[\\d{4}.\\d{2}.\\d{1}]-[\\d{3}]+.exe"
  target_line <- grep(pat, page, value = TRUE) #pattern matching
  m <- regexpr(pat, target_line)
  URL <- unique(regmatches(target_line, m))


  if(length(URL) != 1) {
    message("You'll need to go to the site and download this yourself. I'm now going to try and open the url for you.")
    browseURL(page_with_download_url)
    return(FALSE)
  }

  # install.
  install.URL(URL,...)
}

#Does not work, seems like a useless function.
install.RStudio('https://posit.co/download/rstudio-desktop/')





