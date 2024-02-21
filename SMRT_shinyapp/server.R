#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(DT)

function(input, output, session) {

  data <- reactive({
    # Importing Data
    library(readxl)
    Seattle_Car_Crashes <- read_excel("Seattle Car Crashes.xlsx")
    
    # Removing NA Values from the data
    library(tidyverse)

  })
  
  # Render the data as a DataTable
  output$mytable <- renderDT({
    datatable(data())
  })
}
