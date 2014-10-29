require(shiny)
require(markdown)

shinyUI(pageWithSidebar(
  
  headerPanel("Poisson Process"),
  
  sidebarPanel(
    #style="min-width:235px;max-width:275px",
    numericInput('rate', 'Rate', value=1),
    numericInput('t', 'End time for simulation', value=1),
    submitButton('Simulate.')
  ),
    
  mainPanel(
    tabsetPanel(
      tabPanel('Simulation',          plotOutput('simulation'),  textOutput('text')),
      tabPanel('Inter-arrival times', plotOutput('interarrival'), textOutput('text')),
      tabPanel('Help', includeMarkdown('help.md'))
    )
  )
))
