box::use(
  shiny[bootstrapPage, moduleServer, NS, renderText, tags, textOutput],
  shiny.fluent[...],
  shiny.router[...],
)

box::use(
  view/one,
  view/two
)


## Pages
one_page <- tags$div(
  one$ui("one")
)
two_page <- tags$div(
  two$ui("two")
)


## Make Router
router <- shiny.router::make_router(
  route("one", one_page, one$server), ## Not sure if this is the right function call
  route("two", two_page, two$server)
)
 

## Main UI
#' @export
ui <- function(id) {
  ns <- NS(id)
  
  ui = shiny::fluidPage(
    tags$div(
      class = "topnav",
      tags$ul(
        tags$a(href = route_link("one"), "One"),
        tags$a(href = route_link("two"), "Two")
      )
    ),
    
    router$ui
  )
}


## Main Server
#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    one$server("one") ## Calls server only once
    ## Not calling server two as example as well
    router$server(input, output, session) ## Seems to call both servers, but not continuously
  })
}
