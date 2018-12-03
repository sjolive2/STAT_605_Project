library(RSQLite)
library(RMySQL)
library(ggplot2)
library(tidyverse)
library(dplyr)
dcon <- dbConnect(SQLite(), dbname = "/Users/janghoik/Documents/Rice Course/RData/data/reddit_db.db")

query <- "
SELECT subreddit, body, score
FROM Sample_Data
;"
res <- dbSendQuery(dcon, query)
df <-as.data.frame(dbFetch(res, -1))
dbClearResult(res)

dcon <- dbConnect(SQLite(), dbname = "/Users/janghoik/Documents/Rice Course/RData/data/reddit_db.db")
query <- "
SELECT numberofsubscribers, subredditname as subreddit
FROM subreddits1000
;"
res <- dbSendQuery(dcon, query)
subreddits1000<-dbFetch(res, -1)
dbClearResult(res)
subreddits1000
df 
  group_by(df, subreddit) %>% #might have to group by body too
  summarise(averageL=mean(nchar(body)),
            scoresum = sum(score)) #converts string to character length and averages by subreddit ID

new  inner_join(df,subreddits1000)
new <- mutate(new, normalized=df$scoresum/subreddits1000$numberofsubscribers)



ggplot(new, aes(x=numberofsubscriber, y=averageL)) + geom_point()
ggplot(new, aes(x=numberofsubscriber, y=normalized)) + geom_point()