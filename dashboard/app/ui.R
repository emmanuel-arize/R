#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel(h1('IRIS DATA STATISTICS',style='background-color:yellow')),

    
    sidebarLayout(
        sidebarPanel(
            h1(
            selectInput(inputId='x',label = 'X-axis',
                        choices = c("Sepal.Length","Sepal.Width", "Petal.Length",
                                    "Petal.Width","Species"  ),
                        selected = "Sepal.Width"),style='background-color:blue'),
            h1(
            selectInput(inputId='y',label = 'y-axis',
                        choices = c("Sepal.Length","Sepal.Width", "Petal.Length",
                                    "Petal.Width","Species"  ),
                        selected = '"Sepal.Length"'),style='background-color:green')
           
        ),
        mainPanel(
            helpText(h1('Summary Statistics ',style='background-color:tomato')),
            verbatimTextOutput(outputId='summary'),
            plotOutput(outputId='scatterplot'),
            
            helpText(h1('Static Display ',style='background-color:yellow')),
            tableOutput('static'),
            helpText(h1('Dynamic Display',style='color:blue')),
            dataTableOutput('dynamic')
            
        )
        
    )
))
