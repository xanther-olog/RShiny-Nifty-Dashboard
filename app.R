library(shiny)
ui <- fluidPage(
    selectInput(
        inputId = "stockName",
        label = "Select your stock:",
        choices =
            c(
                "AXISBANK" = "AXISBANK",
                "HDFCBANK" = "HDFCBANK",
                "HEROMOTOCO" = "HEROMOTOCO",
                "INFY" = "INFY",
                "JSWSTEEL" = "JSWSTEEL",
                "NSEI" = "NSEI",
                "TATAMOTORS" = "TATAMOTORS",
                "TATASTEEL" = "TATASTEEL",
                "TCS" = "TCS"
            )
    ),
    
    htmlOutput("return"),
    plotOutput("closePlot"),
    plotOutput("openPlot"),
    plotOutput("highPlot"),
    plotOutput("lowPlot")
)

server <- function(input, output) {
    output$return <- renderUI({
        df <-
            read.csv(
                paste(
                    "C:\\Users\\Biswadip Basu\\Documents\\R\\R-Dashboard\\data\\",
                    input$stockName,
                    ".csv" ,
                    sep = ""
                )
            )
        last_row = tail(df, n = 1)
        first_row = head(df, n = 1)
        strong(paste("Returns: ", round((last_row$Close - first_row$Close) * 100 /
                                            first_row$Close,
                                        2
        ), "% ", sep = ""))
        
    })
    output$openPlot <- renderPlot({
        df <-
            read.csv(
                paste(
                    "C:\\Users\\Biswadip Basu\\Documents\\R\\R-Dashboard\\data\\",
                    input$stockName,
                    ".csv" ,
                    sep = ""
                )
            )
        dfNew <- df
        dfNew$Date <- as.Date(df$Date)
        plot(
            dfNew$Date,
            dfNew$Open,
            type = "l",
            xaxt = "n",
            xlab = "Date",
            ylab = "Open-Value",
            main = "August - Opening value plot"
        )
        axis(1,
             dfNew$Date,
             format(dfNew$Date, "%d-%m-%Y"))
        
    })
    output$highPlot <- renderPlot({
        df <-
            read.csv(
                paste(
                    "C:\\Users\\Biswadip Basu\\Documents\\R\\R-Dashboard\\data\\",
                    input$stockName,
                    ".csv" ,
                    sep = ""
                )
            )
        dfNew <- df
        dfNew$Date <- as.Date(df$Date)
        plot(
            dfNew$Date,
            dfNew$High,
            type = "l",
            xaxt = "n",
            xlab = "Date",
            ylab = "High-Value",
            main = "August - High value plot"
        )
        axis(1,
             dfNew$Date,
             format(dfNew$Date, "%d-%m-%Y"))
    })
    
    output$lowPlot <- renderPlot({
        df <-
            read.csv(
                paste(
                    "C:\\Users\\Biswadip Basu\\Documents\\R\\R-Dashboard\\data\\",
                    input$stockName,
                    ".csv" ,
                    sep = ""
                )
            )
        dfNew <- df
        dfNew$Date <- as.Date(df$Date)
        plot(
            dfNew$Date,
            dfNew$Low,
            type = "l",
            xaxt = "n",
            xlab = "Date",
            ylab = "Low-Value",
            main = "August - Low value plot"
        )
        axis(1,
             dfNew$Date,
             format(dfNew$Date, "%d-%m-%Y"))
    })
    
    output$closePlot <- renderPlot({
        df <-
            read.csv(
                paste(
                    "C:\\Users\\Biswadip Basu\\Documents\\R\\R-Dashboard\\data\\",
                    input$stockName,
                    ".csv" ,
                    sep = ""
                )
            )
        dfNew <- df
        dfNew$Date <- as.Date(df$Date)
        plot(
            dfNew$Date,
            dfNew$Close,
            type = "l",
            xaxt = "n",
            xlab = "Date",
            ylab = "Close-Value",
            main = "August - Close value plot"
        )
        axis(1,
             dfNew$Date,
             format(dfNew$Date, "%d-%m-%Y"))
    })
}

shinyApp(ui = ui, server = server)
