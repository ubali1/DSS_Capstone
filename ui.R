## UI.R file for next word prediction app

shinyUI(pageWithSidebar(
        headerPanel("Next Word Prediction"),
            sidebarPanel(
                tabsetPanel(
                  tabPanel("Text Input",
                  textInput("text", "Enter your text here",""))
                ) # end of tabsetPanel
            ), # end of sidebarPanel

            mainPanel(
             tabsetPanel(
               tabPanel("About",
                        br(), br(),
                        h3('Coursera Data Science Capstone Project'),
                        h4('Introduction'),
                        p('This app was developed to support the capstone project for the Coursera Data Science specialization. The objective is to build a Shiny application that predicts the next word in a sequence of texts entered by a user as seen in prediction text applications used in mobile phones. This project was developed in cooperation with SwiftKey.'), 
                        h4('Method'),
                        p('The source text data used for creating a Corpus was downloaded from HC Corpora (www.corpora.heliohost.org) and used to generate Term Document Matrices. The data set downloaded from HC Corpora was preprocessed first to remove punctuations, whitespace, numbers etc. and then a Corpus was subsequently generated which was used for tokenization and the generation of n-grams. Data frames containing bi, tri and quad-gram frequency matrices were used for next word prediction which corresponded to the word with the highest frequency based on the sequence of preceding user input text.'), 
                        p('This application uses a shiny reactive function to simultaneously generate the next word whilst the user is entering some text in the field and the predicted next word is outputted into a new cell along with the text inputted by the user.'),
                        h4('Location'),
                        p('This app is hosted on shinyapps.io: '),
                        p('The code for generating this app along with the milestone report can be found on GitHub at: https://github.com/ubali1/DSS_Capstone'),
                        p('A slide deck pitching this app can be found here: ')
               ), # end of tabPanel 1
               
               tabPanel("Word Prediction",
                   h4("The next predicted word is:"),
                   textOutput("predictedWord"),      
                   br(),
                   h4("What you have entered:"),
                   textOutput("enteredWords")
                  ) # end of tabPanel
              ) #end of tabsetPanel
            ) #end of main panel
  ) #end of pageWithSidebar
) #end of shinyUI
