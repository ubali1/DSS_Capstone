# DSS_Capstone
This app was developed to support the capstone project for the Coursera Data Science specialization. The objective is to build a Shiny application that predicts the next word in a sequence of texts entered by a user as seen in prediction text applications used in mobile phones. This project was developed in cooperation with SwiftKey.
The source text data used for creating a Corpus was downloaded from HC Corpora (www.corpora.heliohost.org) and used to generate Term Document Matrices. The data set downloaded from HC Corpora was preprocessed first to remove punctuations, whitespace, numbers etc. and then a Corpus was subsequently generated which was used for tokenization and the generation of n-grams. Data frames containing bi, tri and quad-gram frequency matrices were used for next word prediction which corresponded to the word with the highest frequency based on the sequence of preceding user input text.
This application uses a shiny reactive function to simultaneously generate the next word whilst the user is entering some text in the field and the predicted next word is outputted into a new cell along with the text inputted by the user.

This app is hosted on shinyapps.io:

The code for generating this app along with the milestone report can be found on GitHub at: https://github.com/ubali1/DSS_Capstone

A slide deck pitching this app can be found here: 
