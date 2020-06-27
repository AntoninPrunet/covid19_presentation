# packages upload
library(shiny)
library(googleVis)
library(lubridate)
library(dplyr)
library(plotly)

# data upload
data <- read.csv("data/covid_data.csv")[,2:8]
data$date <- ymd(data$date)
country <- unique(data$location)


shinyUI(fluidPage(

    # Application title
    titlePanel("Covid19 Evolution App"),


        sidebarLayout(
        sidebarPanel(
            
            #Text instructions
            h3("Overview:"),
            p("You can select the covid19 epidemic observation parameters you want to 
            overview below, along with a specific date and one or several countries."),
            p("The first chart compares the evolution of your selected parameter for the
              given countries."),
            p("The second chart represents a world map repartition of your selected parameter
              for the given date."),
            
            br(),

            
            # date slider
            sliderInput(inputId = "date",
                        label = "Select a date:",
                        min = ymd("2019-12-31"),
                        max = ymd("2020-06-25"),
                        value = ymd("2020-04-28")),
            
            br(),
            
            # country selection
            selectInput(inputId = "country",
                        label = "Select countries: ",
                        choices = country,
                        selected = c("United States","Brazil","Italy"),
                        multiple = TRUE),
            
            br(),
            
            # type of observation selection (either the number of covid19 cases or
            # the number of dead people)
            selectInput(inputId = "type",
                        label = "Type of Observation:",
                        choices = c("Covid Cases","Deaths"),
                        selected = "Deaths"),
            
            br(),
            
            # selection of either daily cases or total accumulation of cases
            selectInput(inputId = "new",
                        label = "Daily cases or total accumulation:",
                        choices = c("Total Cases","New Cases"),
                        selected = "Total Cases"),
            
            br(),
            # checkbox for considering the population ratio or not in the output
            checkboxInput(inputId = "ratio",
                          label = "Consider population ratio")
        ),
        mainPanel(
            # plot output, showing the evolution of a certain category of the epidemic for
            # given countries
            plotlyOutput("plot"),
            
            # world map showing the same category of observations for a given time
            htmlOutput("geo")
            )
        )

)
)

