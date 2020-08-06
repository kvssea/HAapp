
server <- function(input, output) {
  
  filter_MP <- function() {
    weandata <- read.csv('HAIappData.csv', header = T, stringsAsFactors = F, encoding = "UTF-8")
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
#shinyApp(ui = ui, server = server)



