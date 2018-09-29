library(shiny)
library(shinyIncubator)

plot.points <- function(list.points, list.mul, list.add){
  list.return = list()
  for ( i in 1:length(list.mul)){
    list.temp <- lapply(list.points, '%*%', list.mul[[i]])
    list.temp <- lapply(list.temp, '+', list.add[[i]])
    list.return <- c(list.return, list.temp)
  }
  return(list.return)
}

server <- function(input, output, session) {
  output_plot <- reactive({
    df <- as.data.frame(input$foo)
    for ( i in 1:nrow(df)){
      mul <- matrix(c(df[[1]][[i]], df[[2]][[i]], df[[3]][[i]], df[[4]][[i]]),
                    nrow=2,
                    ncol=2,
                    byrow = TRUE)
      add <- matrix(c(df[[5]][[i]], df[[6]][[i]]), nrow = 1)
      
      if (i == 1){
        list.mul <- list(mul)
        list.add <- list(add)
      } else {
        list.mul <- c(list.mul, list(mul))
        list.add <- c(list.add, list(add))
      }
    }
    
    if (input$pch == "Hollow Circle") pch <- 1
    else if (input$pch == "Plus") pch <- 3
    else if (input$pch == "Cross") pch <- 4
    else if (input$pch == "Solid Circle") pch <- 20
    else if (input$pch == "Dot") pch <- "."
    
    newlist <-list(matrix(c(0,0), nrow = 1))
    
    for (i in 1: input$iterations){
      newlist <- plot.points(newlist, list.mul, list.add)
      data<-do.call(rbind,newlist)
      colors<-c(mapply(rep,1:length(newlist),sapply(newlist,nrow)),recursive=T)
      plot(data, col = colors, pch = pch)
    }
  })
  
  output$plot <- renderPlot({output_plot()})
  
}

df.initial <- data.frame(a = c(0.5, 0.5, 0.5),
                         b = c(0, 0, 0),
                         c = c(0, 0, 0),
                         d = c(0.5, 0.5, 0.5),
                         e = c(0, 1, 2),
                         f = c(0, 1, 0))

ui <- fluidPage(
  titlePanel('Computation of IFS'),
  mainPanel(
    matrixInput('foo', 'Foo', df.initial),
    plotOutput('plot'),
    tableOutput('table')
  ),
  fluidRow(
    shiny::column(4, offset = 1,
                  sliderInput("iterations", "Iterations",
                              min = 1, max = 10,
                              value = 1, animate = TRUE),
                  selectInput('pch', 'Plot Symbol', c("Hollow Circle", "Plus", "Cross", "Solid Circle", "Dot"))
    )
  )
)

shinyApp(ui, server)