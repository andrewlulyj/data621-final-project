library(dplyr)

life <- read.csv('data\\Life Expectancy Data.csv')
death <- read.csv('data\\number-of-deaths-by-risk-factor.csv')
war <- read.csv('data\\ucdp-prio-acd-181.csv')

life.unique <- unique(life$Country)
death.unique <- unique(death$Entity)
death.unique[!(death.unique %in% life.unique)]
life.unique[!(life.unique %in% death.unique)]

names(death)[1] <- 'Country'

a <- left_join(death, life[,c('Country', 'Year', 'Life.expectancy')], by = c('Country', 'Year'))
write.csv(a, 'a.csv')

dim(a)
dim(life)
dim(death)

apply(apply(death, 2, is.na), 2, sum)
apply(apply(life, 2, is.na), 2, sum)
apply(apply(a, 2, is.na), 2, sum)

a[is.na(a$Life.expectancy),c('Country','Year')]
