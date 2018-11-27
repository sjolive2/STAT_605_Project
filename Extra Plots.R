
query <- "
SELECT subredditname, numberofsubscribers,redditbase36id as subreddit_id
FROM subreddits_basic
WHERE numberofsubscribers !='None'
ORDER BY numberofsubscribers DESC
LIMIT 1000;"
res <- dbSendQuery(dcon, query)
subreddits1000 <-dbFetch(res, -1)
dbClearResult(res)
dbRemoveTable(conn = dcon, name = "subreddits1000")
dbWriteTable(conn = dcon, name = "subreddits1000", subreddits1000,
             append = FALSE, row.names = FALSE)

df %>%
  group_by(id) %>% #might have to group by body too
  summarise(averageL=mean(nchar(body)),
            scoresum = sum(score)) #converts string to character length and averages by subreddit ID

new <- inner_join(df,subreddits1000)
new %>% as_tibble() %>% mutate(
  normalized <-  df$scoresum/df$numberofsubscriber)


ggplot(new, aes(x=numberofsubscriber, y=averageL)) + geom_point()
ggplot(new, aes(x=numberofsubscriber, y=normalized)) + geom_point()

