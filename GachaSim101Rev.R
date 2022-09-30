#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(argonDash)
library(argonR)
library(shinyjs)
library(shinythemes)
library(shinyWidgets)
library(shinyalert)

ui <- fluidPage(
    theme = shinytheme("superhero"), 
    titlePanel(
        h1("Gacha Simulator 101", align = "center")),
    titlePanel(
        h2("Select Your Packages", align = "center")),
    fluidPage(
      circleButton(inputId = "btn1",
                   align = "center"
                   , style = "margin-bottom: 200px;"
                   , style = "margin-top: 250px;"
                   , style = "margin-left: 150px"
                   , size = "lg"),
      circleButton(
        inputId = "btn2",
        status = "primary", 
        align = "center"
        , style = "margin-bottom: 200px;"
        , style = "margin-top: 250px;"
        , style = "margin-left: 150px"
        , size = "lg"
      ), 
      circleButton(inputId = "btn3",
                   status = "secondary",
                   align = "center"
                   , style = "margin-bottom: 200px;"
                   , style = "margin-top: 250px;"
                   , style = "margin-left: 150px"
                   , size = "lg"), 
      h4("Standard x10"
         , style = "margin-bottom: -180px;"
         , style = "margin-top: -180px;"
         , style = "margin-left: 130px"),
      h4("Premium x1"
         , style = "margin-bottom: 0px;"
         , style = "margin-top: 160px;"
         , style = "margin-left: 370px"),
      h4("Premium x10"
         , style = "margin-bottom: 0px;"
         , style = "margin-top: -20px;"
         , style = "margin-left: 600px"),
      verbatimTextOutput("res1"),
      verbatimTextOutput("res2"),
      verbatimTextOutput("res3"),
      verbatimTextOutput("res4"),
      verbatimTextOutput("res5"),
      verbatimTextOutput("res6")
    )
    )

server <- function(input, output, session) {
  observeEvent(input$btn1, {
    mc.sim1=function(x,rarity,PDF) 
    {
      CDF=cumsum(PDF)
      upper=NULL
      lower=NULL
      check=NULL
      for(k in 1:length(PDF))
      {
        upper[k]=CDF[k]
        lower[k]=CDF[k]-PDF[k]
      }
      table=data.frame(rarity,PDF,CDF)
      cat("Gacha Simulation Table")
      cat("\n")
      print(table)
      cat("\n")
      for(i in 1:length(check))
      {
        cat("The",i,"th roll produces :",check[i],"star rarity item. \n")
      }
      return(check)
    }
    
    runif(10)
    rarity = 1:4
    PDF = c(0.75, 0.2, 0.04, 0.01)
    sim1 = mc.sim(x, rarity, PDF)
    
    shinyalert(
      title = "Display Image", 
      imageUrl = paste0("images/p", r1, ".jpg"),
      showConfirmButton = TRUE, 
      confirmButtonText = "Next >>", 
      showCancelButton = TRUE, 
      cancelButtonText = "Close", 
      callbackR = function(x){
        if(isTRUE(x)){
          shinyalert(title = "Yeeay!")
        }
      }
    )
  })
  observeEvent(input$btn2, {
    mc.sim=function(x,rarity,PDF) 
    {
      CDF=cumsum(PDF)
      upper=NULL
      lower=NULL
      check=NULL
      for(k in 1:length(PDF))
      {
        upper[k]=CDF[k]
        lower[k]=CDF[k]-PDF[k]
      }
      }
      table=data.frame(rarity,PDF,CDF)
      cat("Gacha Simulation Table")
      cat("\n")
      print(table)
      cat("\n")
      for(i in 1:length(check))
      {
        cat("The",i,"th roll produces :",check[i],"star rarity item. \n")
      }
      return(check)
    
    runif(1)
    rarity = 1:4
    PDF = c(0.35, 0.45, 0.15, 0.05)
    sim2 = mc.sim(x, rarity, PDF)
    shinyalert(
      title = "Display Image", 
      imageUrl = paste0("images/p", r1, ".jpg"),
      showConfirmButton = TRUE, 
      confirmButtonText = "Next >>", 
      showCancelButton = TRUE, 
      cancelButtonText = "Close", 
      callbackR = function(x){
        if(isTRUE(x)){
          shinyalert(title = "Yeeay!")
        }
      })
  })
    
  observeEvent(input$btn3, {
    mc.sim=function(x,rarity,PDF) 
    {
      CDF=cumsum(PDF)
      upper=NULL
      lower=NULL
      check=NULL
      for(k in 1:length(PDF))
      {
        upper[k]=CDF[k]
        lower[k]=CDF[k]-PDF[k]
      }
    }
      table=data.frame(rarity,PDF,CDF)
      cat("Gacha Simulation Table")
      cat("\n")
      print(table)
      cat("\n")
      for(i in 1:length(check))
      {
        cat("The",i,"th roll produces :",check[i],"star rarity item. \n")
      }
      return(check)
    
    shinyalert(
      title = "Display Image", 
      imageUrl = paste0("images/p", r1, ".jpg"),
      showConfirmButton = TRUE, 
      confirmButtonText = "Next >>", 
      showCancelButton = TRUE, 
      cancelButtonText = "Close", 
      callbackR = function(x){
        if(isTRUE(x)){
          shinyalert(title = "Yeeay!")
        }
      }
    )
  })
  
}
# Run the application 
shinyApp(ui = ui, server = server)
