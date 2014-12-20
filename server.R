#Shiny tutorial http://shiny.rstudio.com/tutorial/lesson6/
#Navbar layout http://shiny.rstudio.com/gallery/navbar-example.html

#run once
library (randomForest)
library (caret)
load ("TrainedModel.RDA") #modFit, training
# see *_Internal project for model build


shinyServer(
    function(input, output) {
        output$caseNo <- renderText({
            paste0("Selected test case # " , input$caseNo)
        })
        output$digit <- renderPlot({
            #dev.new(width = 1, height=4)
            image(matrix(as.integer(testing[input$caseNo,-1]), nrow=28)[,28:1], col=gray(12:1/12))
            #dev.off()
        }, height = 200, width=200)
        output$textReal <-  renderText({
            paste0("Real digit is ", testing[input$caseNo,1])
        })
        output$textPredicted <- renderText({
            predicted <- predict (modFit, newdata = testing[input$caseNo,])
            #span("groups of words", style = "color:blue"),
            res <- ifelse(predicted == testing[input$caseNo,1], "RIGHT.", "WRONG!")
            paste0("Predicted digit is " , predicted, ", the Model is ", res)
        })
    }
)