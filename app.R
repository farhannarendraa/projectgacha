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

source("www/Premiumx1.R", local=TRUE)

ui <- fluidPage(
  useShinyalert(),
  actionButton(inputId ="mybutton", "Run"),
  theme = shinytheme("superhero"), 
  setBackgroundImage(
    src = "https://cdn5.f-cdn.com/contestentries/1247677/21891770/5a786ab701b3d_thumb900.jpg"
  ),
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
  showModal(modalDialog(
    title = "Welcome to Gacha Simulator !!!",
    HTML(
      '
    <i class="fas fa-arrow-alt-circle-right"></i>&emsp;
    This is purely a fan made Application, enjoy it !'
    ),
    footer = modalButton("START"),
    size = c("m"),
    easyClose = FALSE,
    fade = TRUE
  ))
  observeEvent(input$btn1, {
    shinyalert(
      title = "Congrats!", 
      imageUrl="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/84dc13b7-a2e7-4b45-83ec-311e72e82900/ddhocli-faa83aca-7c05-413b-92f3-40f913fa3ffb.png/v1/fill/w_297,h_360,strp/chibi_sai_render__ninja_heroes__by_maxiuchiha22_ddhocli-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzYwIiwicGF0aCI6IlwvZlwvODRkYzEzYjctYTJlNy00YjQ1LTgzZWMtMzExZTcyZTgyOTAwXC9kZGhvY2xpLWZhYTgzYWNhLTdjMDUtNDEzYi05MmYzLTQwZjkxM2ZhM2ZmYi5wbmciLCJ3aWR0aCI6Ijw9Mjk3In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.0SsrH5uh1YUZ6sdf0pRm2VcpJ5X_a83HGXuau3Ocxng",
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
      source("www/Premiumx1.R")
      shinyalert(
        title = "Congrats!", 
        imageUrl= "https://i.pinimg.com/originals/2e/3a/55/2e3a55bfa2e1f5bf552484e45d9094aa.png",
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
  observeEvent(input$btn3, {
    shinyalert(
      title = "Congrats!", 
      imageUrl= "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTY8BJRN5Cq7CBTZIcRzQGNQr8-9kxDIc2R3TA2ZPDmOF5tRWuDdvkdUxsjmDvcLjLP1s&usqp=CAU",
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