weandata <- read.csv('HAIappData.csv', header = T, stringsAsFactors = F)
library(dplyr)
library(shiny)
library(shinyWidgets)
library(DT)

ui <- fluidPage(
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
    


server <- function(input, output) {
    
    filter_MP <- function() {
        weandata %>% 
        {if(input$MPbox == 1) filter(.,`Melt.Point` >= input$MP[1] & `Melt.Point` <= input$MP[2]) else(.)}%>% 
       {if(input$HTbox == 1) filter(.,`Hot.Tensile` >= input$HT[1] & `Hot.Tensile` <= input$HT[2]) else(.)}%>% 
        {if(input$CTbox == 1) filter(.,`Cold.Tensile` >= input$CT[1] & `Cold.Tensile` <= input$CT[2]) else(.)} %>%
        {if(input$GFNCbox == 1) filter(.,`GFN.Coated` >= input$GFNCoated[1] & `GFN.Coated` <= input$GFNCoated[2]) else(.)} %>% 
      {if(input$GFNRbox == 1) filter(.,`GFN.Raw` >= input$GFNRaw[1] & `GFN.Raw` <= input$GFNRaw[2]) else(.)} %>%
        {if(input$LOIbox == 1) filter(.,`LOI` >= input$LOI[1] & `LOI` <= input$LOI[2]) else(.)} 
      
       
    
    }
   
 
    output$testqc <- DT::renderDT({

       data <- datatable(filter_MP(),options = list(
         pageLength = 20))


    })
}

# Run the application 
shinyApp(ui = ui, server = server)


#install.packages("shiny")
