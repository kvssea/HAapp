server <- function(input, output) {
    weandata <- read.csv('HAIdata3.csv', stringsAsFactors = F, header = T)
    filter_MP <- function() {
        weandata %>% 
            {if(input$MPbox == 1) filter(.,`Melt.Point` >= input$MP[1] & `Melt.Point` <= input$MP[2]) else(.)}%>% 
            {if(input$HTbox == 1) filter(.,`Hot.Tensile` >= input$HT[1] & `Hot.Tensile` <= input$HT[2]) else(.)}%>% 
            {if(input$CTbox == 1) filter(.,`Cold.Tensile` >= input$CT[1] & `Cold.Tensile` <= input$CT[2]) else(.)} %>%
            {if(input$GFNCbox == 1) filter(.,`GFN.Coated` >= input$GFNCoated[1] & `GFN.Coated` <= input$GFNCoated[2]) else(.)} %>% 
            {if(input$GFNRbox == 1) filter(.,`GFN.Raw` >= input$GFNRaw[1] & `GFN.Raw` <= input$GFNRaw[2]) else(.)} %>%
            {if(input$LOIbox == 1) filter(.,`LOI` >= input$LOI[1] & `LOI` <= input$LOI[2]) else(.)} %>% 
            {if(input$Lakebox == 1) filter(.,`Lake` == "Yes") else(.)} %>%
            {if(input$KFBbox == 1) filter(.,`KFB` == "Yes") else(.)} %>%
            {if(input$IObox == 1) filter(.,`IO` == "Yes") else(.)} %>%
            {if(input$ECObox == 1) filter(.,`eco` == "Yes") else(.)} %>%
            select('Product.Name', 'SAP', 'Melt.Point', 'Hot.Tensile', 'Cold.Tensile', 'GFN.Coated', 'GFN.Raw', 'LOI')
    }
    
    output$testqc <- DT::renderDT({
        
        data <- datatable(filter_MP(),options = list(
            pageLength = 20))
    })
}
