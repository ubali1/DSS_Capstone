## This file contains functions for cleaning input text and next word predictions for the Data Science Capstone project
## The data sets for the bigram, trigram and quadram frequency dictionaries can be found under the data folder
## The Corpus was generated to create frequency tables from text files downloaded from http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip
## This app would not have been possible without guidance received from https://github.com/mhnierhoff/CapstoneCoursera/tree/master/ShinyApp

suppressPackageStartupMessages(c(
        library(shiny),
        library(tm),
        library(stringr),
        library(stylo)
        ))

## Loading frequency tables

bigram_Data <- readRDS(file="./data/bigram_Data.RData")
trigram_Data <- readRDS(file="./data/trigram_Data.RData")
quadgram_Data <- readRDS(file="./data/quadgram_Data.RData")

## This function cleans input text entered by user and utilizes the tm and stringr libraries

preProcess <-function(text){
        
        processed_text <- tolower(text)
        processed_text <- removePunctuation(processed_text)
        processed_text <- removeNumbers(processed_text)
        processed_text <- str_replace_all(processed_text, "[^[:alnum:]]", " ")
        processed_text <- stripWhitespace(processed_text)
        return(processed_text)
}

## This function splits a given input text into single words (chains of characters delimited with spaces or punctuation marks) and uses the stylo package 

cleanInput <- function(text){
        input_Text <- preProcess(text)
        input_Text <- txt.to.words.ext(input_Text, language="English", preserve.case = TRUE)
        return(input_Text)
}


## The prediction_Text function outputs the last three relevant words for the wordPrediction function contained within

prediction_Text <- function(wordCount,input_Text){
        
        if (wordCount >= 3) {
          input_Text <- input_Text[(wordCount-2):wordCount] 
        }
        
        else if(wordCount == 2) {
          input_Text <- c(NA,input_Text)   
        }
        
        else {
          input_Text <- c(NA,NA,input_Text)
        } # end of prediction_Text function
        
## This function returns the next word with the highest frequency based on the length of the input text
        
wordPrediction <- as.character(quadgram_Data[quadgram_Data$unigram==input_Text[1] & quadgram_Data$bigram==input_Text[2] & quadgram_Data$trigram==input_Text[3],][1,]$quadgram)

        if(is.na(wordPrediction)) {
          wordPrediction1 <- as.character(trigram_Data[trigram_Data$unigram==input_Text[2] & trigram_Data$bigram==input_Text[3],][1,]$trigram)
                        
          if(is.na(wordPrediction)) {
            wordPrediction <- as.character(bigram_Data[bigram_Data$unigram==input_Text[3],][1,]$bigram)
            }
        }

print(wordPrediction)
} # end of prediction_Text function
