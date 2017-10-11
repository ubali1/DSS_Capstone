## server.R file for next word prediction app
## The server file sources data preprocessing file called inputpreProcess.R

source("./inputpreProcess.R")

shinyServer(function(input, output) {
        
        wordPrediction <- reactive({
                text <- input$text
                input_Text <- cleanInput(text)
                wordCount <- length(input_Text)
                wordPrediction <- prediction_Text(wordCount,input_Text)})
        
        output$predictedWord <- renderPrint(wordPrediction())
        output$enteredWords <- renderText({input$text})
})

