library(shiny)
library(ggplot2)

shinyServer(function(input,output) {
  d <- reactive({
    totalCount = rpois(1, input$rate * input$t)
    times = sort(runif(totalCount, 0, input$t))
    data.frame(times=times, count=1:totalCount)
  })
  
  output$simulation <- renderPlot({
    g = ggplot(d(), aes(x=times, y=count)) + geom_step()
  })
  
  output$interarrival <- renderPlot({
    g = ggplot(d(), aes(x=times)) + geom_histogram()
  })
})
