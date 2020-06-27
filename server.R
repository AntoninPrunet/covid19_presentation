library(googleVis)
library(shiny)
library(ggplot2)
library(dplyr)

# data upload

data <- read.csv("data/covid_data.csv")[,2:8]
data$date <- ymd(data$date)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    selected_data1 <- reactive({
        validate(
            need(input$country !="", "Please select a country")
        )
        data %>% filter(location %in% input$country,
                        type == input$type,
                        ratio == input$ratio,
                        new == input$new) %>%
            select (date, location, variable, value)})
    
    selected_data2 <- reactive({data %>% filter(date == input$date,
                                        type == input$type,
                                        ratio == input$ratio,
                                        new == input$new) %>%
            select (date, location, variable, value)})


    

    output$plot <- renderPlotly({
        ggplotly(ggplot(data=selected_data1(),aes(date,value, color=location)) +
            geom_line() +
            ylab(as.character(unique(selected_data1()$variable)[1])) +
            geom_vline(xintercept = as.numeric((input$date))) +
            theme_bw())
        })

    
    output$geo <- renderGvis({
        gvisGeoChart(data = selected_data2(),
                     locationvar = "location",
                     colorvar = "value",
                     option = list(projection="kavrayskiy-vii",
                                   colorAxis="{colors:['white','brown']}"))
        })
})

