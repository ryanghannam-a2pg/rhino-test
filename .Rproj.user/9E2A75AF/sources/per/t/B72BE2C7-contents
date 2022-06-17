box::use(
  shiny[...],
  shiny.fluent[...],
  shiny.router[...]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Two"),
    shiny::actionButton(ns("button"), "Button Two (Doesn't work)"),
    shiny::verbatimTextOutput(ns("out"), TRUE)
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) { ## Server is not working
    print("Server two called")
    observeEvent(input$button, {
      print("Button two called")
      output$out <- "Server two works"
    })
  })
} 