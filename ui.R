library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Check Google searches for Brexit terms over time"),
  h5("This app shows you how often terms were searched for on Google."),
  h5("You can select different countries from where the search was"),
  h5("performed, and narrow the data range that is shown in the graph"),
  h5("for more detailed information."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       dateRangeInput("dates", "Select a date range", 
                      start = "2018-01-01", end = as.character((Sys.Date()))),
       radioButtons("country", "Select the country where the search was made from",
                    choiceNames = c("Great Britain", "USA", "Ireland",
                                    "France", "the Netherlands"),
                    choiceValues = c("GB", "US", "IE", "FR", "NL")),
       checkboxGroupInput("term", "Select a search term", 
                    choices = c("Brexit", "Theresa May", "Boris Johnson",
                                "Jeremy Corbyn"),
                    selected = "Brexit"),
       h6("This app uses the gtrendsR package.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1")
    )
  )
))
