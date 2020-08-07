#weandata <- read.csv('HAIappData.csv', header = T, stringsAsFactors = F)
#setwd("C://Users/kaminskik/Desktop")
#weandata <- read.csv('HAIdata2.csv', header = T, stringsAsFactors = F)

library(dplyr)
library(shiny)
#library(shinyWidgets)
library(DT)
#weandata <- read.csv('HAIdata3.csv', header = T, stringsAsFactors = F)

bootstrapPage(
    ui <- fluidPage(
        
        
        tags$head(
            tags$style(HTML("
 
        .flex-container{
         display: flex;
         }
           
        .flex-child {
         flex: 1;
        }
        
        .flex-child:first-child{
          margin-padding:20px;
          
        }
          .header{
          font-family: 'Franklin Gothic Medium';
          font-size: 24px;
          }
           
          .irs-bar{
          border-color: transparent;
          background-color: #F42E19;
          
          }
          .irs-bar-edge {
          border-color: black;
          border-color: transparent;
          }
          
          .irs-from, .irs-to{
          background: #F42E19;
          }
           
           
    "))
        ),
        titlePanel(title = div(img(src='halogo.png'))),
        
        
        sidebarLayout(
            sidebarPanel(
                
                tags$div(class = "header",
                         "Check to enable search criteria:"
                ),
                
                
                
                
                tags$div(class = "flex-container",
                         tags$div(class = "flex-child 1", id = "performance",
                                  checkboxInput('MPbox','Melt Point', value = 0),
                                  checkboxInput('HTbox','Hot Tensile', value = 0),
                                  checkboxInput('CTbox','Cold Tensile', value = 0),
                                  checkboxInput('GFNCbox','GFN Coated', value = 0),
                                  checkboxInput('GFNRbox','GFN Raw', value = 0),
                                  checkboxInput('LOIbox','LOI', value = 0)
                         ),
                         tags$div(class = "flex-child 2", id = "grades",
                                  checkboxInput('Lakebox','Contains Lake', value = 0),
                                  checkboxInput('KFBbox','Contains Shakeout', value = 0),
                                  checkboxInput('IObox','Contains Iron Oxide', value = 0),
                                  checkboxInput('ECObox','Environmental', value = 0)
                         )),
                tags$div(id = "sliders", style = "font-size: 14px",
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
                                     "GFN Raw:",
                                     min = 20,
                                     max = 120,
                                     step = 5,
                                     value = c(50,70)),
                         
                         sliderInput("GFNCoated",
                                     "GFN Coated:",
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
                )),
            
            
            mainPanel(
                DTOutput("testqc")
            ))))