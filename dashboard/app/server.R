#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$summary<-renderPrint({
        summary(iris) })
    
    
    output$scatterplot<-renderPlot({
        ggplot(data = iris, aes_string(x = input$x, y = input$y, color=input$z)) +
            geom_point(size=3)+geom_smooth(method = lm)
    })
    
    output$histplot<-renderPlot({
        ggplot(data = iris, aes_string(x = input$x)) +geom_histogram(color='blue')
        })
    
    output$static<-renderTable(head(iris,6))
    output$dynamic<-renderDataTable(iris,options =list(pageLength=6))




})
