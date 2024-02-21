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
    
    # Wrangling the Data Set into long Format
    library(tidyverse)
    Seattle_Car_Crashes$INJURIES <- as.character(Seattle_Car_Crashes$INJURIES)
    Seattle_Car_Crashes$SERIOUSINJURIES <- as.character(Seattle_Car_Crashes$SERIOUSINJURIES)
    Seattle_Car_Crashes$FATALITIES <- as.character(Seattle_Car_Crashes$FATALITIES)
    Seattle_Car_Crashes$INCDATE <- as.character.Date(Seattle_Car_Crashes$INCDATE)
    Seattle_Car_Crashes$INCDTTM <- as.character(Seattle_Car_Crashes$INCDTTM)
    Seattle_Car_Crashes <- subset(Seattle_Car_Crashes, select = -c(INCDTTM))
    
    Seattle_Car_Crashes
  })
  
  # Render the data as a DataTable
  output$mytable <- renderDT({
    datatable(data())
  })
}
