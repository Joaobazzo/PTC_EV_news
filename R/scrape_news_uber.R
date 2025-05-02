# scrape_news.R

library(rvest)
library(digest)

# 1. Define the URL and file paths
short_link <- c("electric/zero-emissions-incentive/","electric/","comfort-electric/")
short_name <- c("zero-emissions-incentive","electric","comfort-electric")

for(i in 1:length(short_name)){ # i = 2
  url <-  sprintf("https://www.uber.com/ca/en/drive/services/%s",short_link[i])
  output_file <- sprintf("data-raw/uber/%s_%s.html",short_name[i],Sys.Date())
  hash_file <- sprintf("data/uber/%s_hash.txt",short_name[i])
  
  # 2. Scrape content
  page <- read_html(url)
  news_string <- paste(page, collapse = "\n")
  
  # 3. Compute hash
  current_hash <- digest(news_string, algo = "sha256")
  
  # 4. Load previous hash
  if (file.exists(hash_file)) {
    previous_hash <- readLines(hash_file, warn = FALSE)
  } else {
    previous_hash <- ""
  }
  
  # 5. Compare and save if different
  if (current_hash != previous_hash) {
    cat("New content detected. Saving...\n")
    writeLines(news_string, output_file)
    writeLines(current_hash, hash_file)
  } else {
    cat("No changes detected. Skipping save.\n")
  }
}
