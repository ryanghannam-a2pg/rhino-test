box::use(
  shiny[moduleServer, NS, renderText, tagList, textInput, textOutput]
  
)
box::use(
  app/logic/messages,
)


#' @export
ui <- function(id){
  ns<-NS(id)
  tagList(
    textInput(ns("name"), "Tour name?"),
    textOutput(ns("message"))
  )
}


#' @export
server<-function(id){
  moduleServer(id, function(input, output, session){
    
    output$message <-renderText({
      messages$hello(input$name)
    })
  })

}