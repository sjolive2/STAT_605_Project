newdf <- transmute(df,id,
                   covfefe = str_detect(df$body,("[Cc]ovfefe")), #June
                   # try str_detect(df$body,ignore.case("covfefe"))
                   metoo = str_detect(df$body,"[Mm](e ?Too|e ?too)"), #October
                   RickMorty = str_detect(df$body,"you have to have a very high IQ"),#July
                   Danielle = str_detect(df$body,"([Cc]ash ?[mM]e|[Hh][Oo][Ww] ?[Bb][oO][Ww]?[Uu]?[Tt]?)"), #January
                   TrumpTrade = str_detect(df$body,"has been the worst trade deal"), #March/April
                   LuckyLuciano = str_detect(df$body,"had to do it to '?em"),#January
                   Despacito = str_detect(df$body,"[Dd]espacito"),#July
                   Dankstorm = str_detect(df$body,"([Dd]arude|[Ss]arude)"),#any month
                   RickRoll = str_detect(df$body,"h?t?t?p?s?:?/?/?www.youtube.com/watch?v=dQw4w9WgXcQ"),#any month
)

#code used to check number of matches for a regex and their context:
#testdf2 <- filter(df,str_detect(df$body,"[Ll][Ff]?(mao|MAO)"))

#new plot ideas:
# 1: Scatter of average number of comment length by subreddit subscription number (Prediction: more popular subreddits have less comment length)
# 2: Normalized scatter of sum of upvotes/downvotes(interaction) by subreddit subscription number (Prediction: middle subreddits have most interaction)
