library(tidyverse, warn.conflicts = FALSE)
library(lubridate, warn.conflicts = FALSE)

stats <- read.csv('data/academatica_video_stats.csv')
metadata <- read.csv('data/new_metadata.csv')
videos <- read.csv('data/new_videos.csv')

head(stats)

# Cantidad de videos
nrow(videos)
nrow(metadata)
nrow(stats)

# Videos con mas views
ordenByViews <- 
  stats %>% arrange(desc(viewCount))

# Videos con mas likes
ordenByLikes <- 
  stats %>% arrange(desc(likeCount))

# Videos con mas dislikes
ordenByDislikes <- 
  stats %>% arrange(desc(dislikeCount))

# Videos Favoritos --> ni uno
favoriteVideos <- unique(stats$favoriteCount)

# Videos mas comentados
ordenByComments <- 
  stats %>% arrange(desc(commentCount))

# Understanding data video
unique(videos$kind)
length(unique(videos$contentDetails.videoId))
length(unique(videos$date))

# Group By date
videosDate <- videos %>% group_by(date)
n_groups(videosDate)

# Count videos publish by date
videosByDate <-
  videosDate %>%
    summarise(avg_count = n()) %>% arrange(desc(avg_count))

# Getting year,month and day
videosYear <- year(ymd(videos$date))
videosMonth <- month(ymd(videos$date))
videosDay <- day(ymd(videos$date))

# Adding to dataframe
videos$yearPublish <- videosYear
videos$monthPublish <- videosMonth
videos$dayPublish <- videosDay

# Stats by YEAR
yearGroupVideos <- videos %>% group_by(yearPublish)
# 15 year publish videos
length(unique(videos$yearPublish))

# Count videos publish by year
videosByYear <-
  yearGroupVideos %>%
  summarise(avg_count = n()) %>% arrange(desc(avg_count))


# Stats by month
monthGroupVideos <- videos %>% group_by(monthPublish)
# Count videos publish by month
videosByMonth <-
  monthGroupVideos %>%
  summarise(avg_count = n()) %>% arrange(desc(avg_count))


# Stats by month
yearMonthGroupVideos <- videos %>% group_by(yearPublish, monthPublish)
# Count videos publish by month
videosByYearMonth <-
  yearMonthGroupVideos %>%
  summarise(avg_count = n()) %>% arrange(desc(avg_count))

year2012 <- videosByYearMonth %>% filter(yearPublish == 2012)



















