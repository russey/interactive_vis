library(shiny)
library(ggplot2)

# Define the user interface component
ui <- fluidPage(
  sliderInput(
    inputId = "bins",
    label = "Number of bins:",
    min = 1,
    max = 50,
    value = 30
  ),
  selectInput(
    inputId = "colour",
    label = "Plot colour",
    choices = c("red", "blue", "green")
  ),
  plotOutput(outputId = "hist")
)

# Define the server component
server <- function(input, output) {
  
  # Render the plot using the output and input values
  output$hist <- renderPlot({
    ggplot(faithful, aes(x = waiting)) + geom_histogram(bins = input$bins, fill = input$colour)
  })
}

# Combine the two components
shinyApp(ui = ui, server = server)