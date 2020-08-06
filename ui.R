
library(dplyr)
library(shiny)
library(shinyWidgets)
library(DT)

ui <- fluidPage(
  eandata <- read.csv('HAIappData.csv', header = T, stringsAsFactors = F)
  titlePanel(title = div(img(src='halogo.png'))),
  setSliderColor(c('Red','Red','Red','Red','Red','Red'),c(1:6)),
  sidebarLayout(
    sidebarPanel(
      
      checkboxInput('MPbox','Melt Point:', value = 0),
      checkboxInput('HTbox','Hot Tensile:', value = 0),
      checkboxInput('CTbox','Cold Tensile:', value = 0),
      checkboxInput('GFNCbox','GFN C:', value = 0),
      checkboxInput('GFNRbox','GFN R:', value = 0),
      checkboxInput('LOIbox','LOI:', value = 0),
      
      sliderInput("MP",
                  "Melt Point:",
                  min = 180,
                  max = 250,
                  step = 5,
                  value = c(200,220)),
      
      sliderInput("HT",
                  "Hot Tensile:",
                  min = 50,
                  max = 750,
                  step = 25,
                  value = c(200,500)),
      
      sliderInput("CT",
                  "Cold Tensile:",
                  min = 100,
                  max = 1000,
                  step = 25,
                  value = c(200,500)),
      
      
      sliderInput("GFNRaw",
                  "GFN-R:",
                  min = 20,
                  max = 120,
                  step = 5,
                  value = c(50,70)),
      
      sliderInput("GFNCoated",
                  "GFN-C:",
                  min = 20,
                  max = 120,
                  step = 5,
                  value = c(50,70)),
      
      sliderInput("LOI",
                  "LOI:",
                  min = 0,
                  max = 7,
                  step = 0.5,
                  value = c(2.5,3.5)),
      
      
    ),
    
    
    mainPanel(
      DTOutput("testqc")
      
      
    )))

