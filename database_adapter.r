library(DBI)
library(odbc)
library(RPostgreSQL)

###############
## Snowflake ##
###############
connect_to_snowflake <- function() {
  conn <- DBI::dbConnect(
    odbc::odbc(),
    readline(prompt = "Enter DSN: "), # "Snowflake64"
    uid = readline(prompt = "Enter user: "),
    pwd = readline(prompt = "Enter password: ")
  )
}

# Example
# conn_sf <- connect_to_snowflake()


##############
## Postgres ##
##############
connect_to_postgres <- function(conf) {
  conn <- DBI::dbConnect(
    dbDriver("PostgreSQL"), 
    host = conf$host,
    port = conf$port,
    dbname = conf$dbname,
    user = conf$user,
    password = conf$password
  )
}

# Example
# conn_pg = connect_to_postgres(rjson::fromJSON(file = ".//conf.json"))
