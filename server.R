if(!require(shiny)){
      install.packages('shiny')
}
if(!require(gtrendsR)){
      install.packages('gtrendsR')
}
if(!require(reshape2)){
      install.packages('reshape2')
}
if(!require(ggplot2)){
      install.packages('ggplot2')
}
if(!require(lubridate)){
      install.packages('lubridate')
}
library(shiny)
library(gtrendsR)
library(reshape2)
library(ggplot2)
library(lubridate)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      
      output$plot1 <- renderPlot({
    
        library(gtrendsR)
        location <- input$country
        bx <- gtrends(keyword = input$term,
                      time = paste(input$dates[1], input$dates[2], sep = " "), 
                      geo = input$country)
        plot1 <- plot(bx)
        output$country <- renderPrint({input$country})
  })
  
})
