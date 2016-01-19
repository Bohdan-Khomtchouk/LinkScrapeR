require(XML)

url <- "http://www.some_URL.com"	#specify your URL
url_source <- readLines(url, encoding = "UTF-8")
all <- getHTMLLinks(url_source)
pdfs <- all[grepl("^http.*\\.pdf", all)]	#scrape all links from this web page that begin with http and end with pdf
pdfs_list <- as.list(pdfs)

for(i in 1:length(pdfs_list)) {
	download.file(pdfs_list[[i]], destfile = paste0('link', i, '.pdf'))
}