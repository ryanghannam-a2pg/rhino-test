box::use(
  shiny[...],
  shiny.fluent[...],
  shiny.router[...]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tagList(
    h1("One"),
    shiny::actionButton(ns("button"), "Button One (Doesn't work)"),
    shiny::verbatimTextOutput(ns("out"), TRUE)
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) { ## Server is not working
    print("Server one called")
    observeEvent(input$button, {
      print("Button one called")
      output$out <- "Server one works"
    })
  })
}
