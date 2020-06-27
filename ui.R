# packages upload
library(shiny)
library(shinythemes)
library(googleVis)
library(lubridate)
library(dplyr)
library(plotly)

# data upload
data <- read.csv("data/covid_data.csv")[,2:8]
data$date <- ymd(data$date)
country <- unique(data$location)


shinyUI(fluidPage(theme=shinytheme("darkly"),

    # Application title
    titlePanel("Covid19 Evolution App"),
    wellPanel(h3("Overview:"),
              p("You can select the covid19 epidemic observation parameters you want to 
            overview below, along with a specific date and one or several countries and
                then visualize it on a time-based chart or a world map repartition.")),


        sidebarLayout(
        sidebarPanel(
            
            # date slider
            sliderInput(inputId = "date",
                        label = "Select a date:",
                        min = ymd("2020-02-28"),
                        max = ymd("2020-06-25"),
                        value = ymd("2020-04-28")),
            
            hr(),
            
            # country selection
            selectInput(inputId = "country",
                        label = "Select countries: ",
                        choices = country,
                        selected = c("United States","Brazil","Italy"),
                        multiple = TRUE),
            
            hr(),
            
            # type of observation selection (either the number of covid19 cases or
            # the number of dead people)
            selectInput(inputId = "type",
                        label = "Type of Observation:",
                        choices = c("Covid Cases","Deaths"),
                        selected = "Deaths"),
            
            
            # selection of either daily cases or total accumulation of cases
            selectInput(inputId = "new",
                        label = "Daily cases or total accumulation:",
                        choices = c("Total Cases","New Cases"),
                        selected = "Total Cases"),
            

            # checkbox for considering the population ratio or not in the output
            checkboxInput(inputId = "ratio",
                          label = "Consider population ratio")
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("World Map", htmlOutput("geo")),
                tabPanel("Country Evolution",plotlyOutput("plot")))
            )

)
))

