# Sets up the work space (load packages and creates reproducible environments)
renv::init(bare = TRUE)

packages <- c('quantmod', 'tidyverse', 'renv')
lapply(packages, library, character.only = TRUE)
renv::snapshot(type = "implicit")

#Stock information
stk1 <- "BTC-CAD"
stk2 <- "XRP-CAD"
fromDate <- "2019-01-01"
toDate <- Sys.Date()

#Time Series Objects
ts_stk1_df <- get(getSymbols(stk1, from = fromDate, to = toDate))
ts_stk1_rt <- allReturns(get(stk1))

ts_stk2_df <- get(getSymbols(stk2, from = fromDate, to = toDate))
ts_stk2_rt <- allReturns(get(stk2))


#Dataframe Objects
stk1_df <- rownames_to_column(data.frame(get(getSymbols(stk1, from = fromDate, to = toDate))), "date")
stk1_rt <- rownames_to_column(data.frame(allReturns(get(stk1))), "date")

stk2_df <- rownames_to_column(data.frame(get(getSymbols(stk2, from = fromDate, to = toDate))), "date")
stk2_rt <- rownames_to_column(data.frame(allReturns(get(stk2))), "date")
