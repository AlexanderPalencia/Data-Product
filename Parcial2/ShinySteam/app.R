library(shiny)
library(dplyr)
library(lubridate)
library(tidyverse)
library(shinymaterial)
library(shinythemes)
library(DT)
library(rsconnect)
fluidPage(theme = shinytheme("cerulean"))

# Define UI for dataset viewer app ----
ui <- navbarPage(theme = shinytheme("cerulean"), "Steam Store",
                 tabPanel("Introduction",
                     titlePanel(h1('Steam Store', align='center')),
                     img(src = "img/steamLogo.png", height = 72, width = 72,class = 'center', style = "display:block; margin-left: auto; margin-right: auto;"),
                     
                     mainPanel(width = 12,
                         h4('WELCOME!'),
                         h5('This webpage was created to present our analysis of Steam Games Data for the class "Data Product" at Universidad Francisco Marroquin.
Here you will be able to navigate through several pages where you will find many insights on the datasets that we worked on, valuable information as well as multiple ways to present the information such as Barplots, Pie Charts,Interactive information as well as reactive. All this is displayed to you with the knowledge acquired at class.', style = "display:center;"),
                         h5('We hope you enjoy our analysis.'),
                         br(),
                         h4('Summary of the Steam Dataset'),
                         br(),
                         align = "center",
                         ),
                     fluidPage(
                         fixedRow(
                             column(4,
                                    div(
                                        div(
                                            textOutput("n_games"),
                                            tags$head(tags$style("
                                                #n_games{
                                                 font-size: 26px;
                                                 font-style: italic;
                                                 text-align: center;
                                                 color: #6495ED;
                                                 }"
                                                )
                                            ),
                                            h4('Games',
                                               style = "
                                                    text-align: center;
                                                    font-family: 'Raleway',sans-serif;
                                                    color: #808080;")
                                        ),
                                        style = "
                                            width: 250px;
                                            padding: 50px;
                                            margin: auto;
                                            box-shadow: 0 19px 38px
                                            rgba(0,0,0,0.30), 0 15px 12px
                                            rgba(0,0,0,0.22);"
                                    )
                             ),
                             column(4, 
                                    div(
                                        div(
                                            textOutput("n_publisher"),
                                            tags$head(tags$style("
                                                #n_publisher{
                                                 font-size: 26px;
                                                 font-style: italic;
                                                 text-align: center;
                                                 color: #6495ED;
                                                 }"
                                            )
                                            ),
                                            h4('Publishers',
                                               style = "
                                                    text-align: center;
                                                    font-family: 'Raleway',sans-serif;
                                                    color: #808080;")
                                        ),
                                        style = "
                                            width: 250px;
                                            padding: 50px;
                                            margin: auto;
                                            box-shadow: 0 19px 38px
                                            rgba(0,0,0,0.30), 0 15px 12px
                                            rgba(0,0,0,0.22);"
                                    )
                                    
                             ),
                             column(4, 
                                    div(
                                        div(
                                            textOutput("n_dev"),
                                            tags$head(tags$style("
                                                #n_dev{
                                                 font-size: 26px;
                                                 font-style: italic;
                                                 text-align: center;
                                                 color: #6495ED;
                                                 }"
                                            )
                                            ),
                                            h4('Developers',
                                               style = "
                                                    text-align: center;
                                                    font-family: 'Raleway',sans-serif;
                                                    color: #808080;")
                                        ),
                                        style = "
                                            width: 250px;
                                            padding: 50px;
                                            margin: auto;
                                            box-shadow: 0 19px 38px
                                            rgba(0,0,0,0.30), 0 15px 12px
                                            rgba(0,0,0,0.22);"
                                    )
                                    
                             )
                        ),
                        br(),
                        br(),
                        fixedRow(
                            column(4,
                                   div(
                                       div(
                                           br(),
                                           br(),
                                           textOutput("n_genre"),
                                           tags$head(tags$style("
                                                #n_genre{
                                                 font-size: 26px;
                                                 font-style: italic;
                                                 text-align: center;
                                                 color: #6495ED;
                                                 }"
                                           )
                                           ),
                                           h4('Genres',
                                              style = "
                                                    text-align: center;
                                                    font-family: 'Raleway',sans-serif;
                                                    color: #808080;")
                                       ),
                                       style = "
                                            width: 250px;
                                            padding: 50px;
                                            margin: auto;
                                            box-shadow: 0 19px 38px
                                            rgba(0,0,0,0.30), 0 15px 12px
                                            rgba(0,0,0,0.22);"
                                   )
                            ),
                            column(4, 
                                   div(
                                       div(
                                           textOutput("n_plat"),
                                           tags$head(tags$style("
                                                #n_plat{
                                                 font-size: 26px;
                                                 font-style: italic;
                                                 text-align: center;
                                                 color: #6495ED;
                                                 }"
                                           )
                                           ),
                                           h4('Plataforms',
                                              style = "
                                                    text-align: center;
                                                    font-family: 'Raleway',sans-serif;
                                                    color: #808080;")
                                       ),
                                       style = "
                                            width: 250px;
                                            padding: 50px;
                                            margin: auto;
                                            box-shadow: 0 19px 38px
                                            rgba(0,0,0,0.30), 0 15px 12px
                                            rgba(0,0,0,0.22);"
                                   )
                                   
                            ),
                            column(4, 
                                   div(
                                       div(
                                           br(),
                                           textOutput("n_avg"),
                                           tags$head(tags$style("
                                                #n_avg{
                                                 font-size: 26px;
                                                 font-style: italic;
                                                 text-align: center;
                                                 color: #6495ED;
                                                 }"
                                           )
                                           ),
                                           h4('Average Playtime (min)',
                                              style = "
                                                    text-align: center;
                                                    font-family: 'Raleway',sans-serif;
                                                    color: #808080;")
                                       ),
                                       style = "
                                            width: 250px;
                                            padding: 50px;
                                            margin: auto;
                                            box-shadow: 0 19px 38px
                                            rgba(0,0,0,0.30), 0 15px 12px
                                            rgba(0,0,0,0.22);"
                                   )
                                   
                            )
                        ),
                        br(),
                        br(),
                        fixedRow(
                            column(4,
                                   div(
                                       div(
                                           textOutput("n_Price"),
                                           tags$head(tags$style("
                                                #n_Price{
                                                 font-size: 26px;
                                                 font-style: italic;
                                                 text-align: center;
                                                 color: #6495ED;
                                                 }"
                                           )
                                           ),
                                           h4('Price range',
                                              style = "
                                                    text-align: center;
                                                    font-family: 'Raleway',sans-serif;
                                                    color: #808080;")
                                       ),
                                       style = "
                                            width: 250px;
                                            padding: 50px;
                                            margin: auto;
                                            box-shadow: 0 19px 38px
                                            rgba(0,0,0,0.30), 0 15px 12px
                                            rgba(0,0,0,0.22);"
                                   )
                            ),
                            column(4, 
                                   div(
                                       div(
                                           textOutput("n_year"),
                                           tags$head(tags$style("
                                                #n_year{
                                                 font-size: 26px;
                                                 font-style: italic;
                                                 text-align: center;
                                                 color: #6495ED;
                                                 }"
                                           )
                                           ),
                                           h4('Collected data',
                                              style = "
                                                    text-align: center;
                                                    font-family: 'Raleway',sans-serif;
                                                    color: #808080;")
                                       ),
                                       style = "
                                            width: 250px;
                                            padding: 50px;
                                            margin: auto;
                                            box-shadow: 0 19px 38px
                                            rgba(0,0,0,0.30), 0 15px 12px
                                            rgba(0,0,0,0.22);"
                                   )
                                   
                            )
                        ),
                 ), 
                 h6('Develop by:', style = "text-align: right;"),
                 h6('Alexaner Palencia', style = "text-align: right;"),
                 h6('Juan Barillas', style = "text-align: right;")
                 ),
                 tabPanel("Data Explorer",      
                          fluidPage(
                              
                              # App title ----
                              titlePanel("Steam Store Data Analysis"),
                              
                              # Sidebar layout with a input and output definitions ----
                              sidebarLayout(
                                  
                                  # Sidebar panel for inputs ----
                                  sidebarPanel(
                                      
                                      # Input: Selector for choosing dataset ----
                                      selectInput(inputId = "dataset",
                                                  label = "Choose a dataset:",
                                                  choices = c("Steam", "Steam description", "steam Media")),
                                      
                                      # Input: Numeric entry for number of obs to view ----
                                      numericInput(inputId = "obs",
                                                   label = "Number of observations to view:",
                                                   value = 5)
                                  ),
                                  
                                  # Main panel for displaying outputs ----
                                  mainPanel(
                                      
                                      fluidRow(
                                          column(width = 1,
                                                 tableOutput("view"),style = "width:95%; overflow-x: scroll; overflow-y: scroll;")
                                      )
                                      # Output: HTML table with requested number of observations ----
                                      
                                  )
                              )
                          )
                          
                          
                          ),
                 tabPanel("Time analysis",      
                          fluidPage(
                              
                              # App title ----
                              titlePanel("Steam Store Data Time Analysis"),
                              
                              # Main panel for displaying outputs ----
                              mainPanel( 
                                  verbatimTextOutput("info"),
                                  plotOutput('plot_year', click = "plot_click"),
                                  tableOutput("df_year")
                              )
                          )
                          
                          
                          
                          
                          ),
                 tabPanel("Data Filter",
                          
                          titlePanel("Data Filter"),
                          fluidRow(
                              column(width = 12,
                                     
                                     DT::dataTableOutput("df_final")
                                     
                              )
                          ),
                          h4(textOutput("vacio")),
                          h1(textOutput('game_title'), align='center'),
                          uiOutput(outputId = "image", align='center'),
                          h3(textOutput('description_game'), align='center'),
                          
                 ),
                 tabPanel("Graphs",
                          titlePanel("Short Analysis Graphs"),
                          
                          mainPanel( 
                              plotOutput('plot_f', click = "plot_click1"),
                              h3('As the graph tells us there is no direct relationship within the price of a game and the amount of owners (The people that have bought the game) it has. We can crearly see a tendency between the game that sell from 0-40 having more owners. The amount of owners is represented in hexadecimal yo express millions in a easier manner.'),
                              
                              plotOutput('plot_1'),
                              
                              plotOutput('plot_2'),
                          )
                          
                 ),
                 tabPanel("URL Parameters",
                          titlePanel("API URL parameters"),
                          
                          # Sidebar panel for inputs ----
                          sidebarPanel(
                              h3('URL Parameters'),
                              h4('Select the URL params to delimit your data'),
                              selectInput(inputId = "ggg",
                                          label = "Genre Paramater",
                                          choices = c("Indie","Action","Casual","Adventure","Strategy","Simulation","RPG","Racing")
                            ),
                            actionButton("update", "Update Data")
                          ),
                          
                          # Main panel for displaying outputs ----
                          mainPanel(
                              
                              fluidRow(
                                  column(width = 8,
                                         tableOutput("uu"),style = "width:95%; overflow-x: scroll; overflow-y: scroll;")
                              )
                              # Output: HTML table with requested number of observations ----
                              
                          )
                          
                 )
                 

                 
                 
                 )
    
    
    


# Define server logic to summarize and view selected dataset ----
server <- function(input, output, session) {
    
    # Import DATA
    data <- read.csv(file = "./data/steam.csv", header = TRUE)
    description_data <- read.csv(file = "./data/steam_description_data.csv", header = TRUE)
    media_data <- read.csv(file = "./data/steam_media_data.csv", header = TRUE)
    
    # Data cleanning merge and transform
    names(description_data)[names(description_data) == "steam_appid"] <- "appid"
    a <- inner_join(data, description_data, by ='appid')
    names(media_data)[names(media_data) == "steam_appid"] <- "appid"
    df <- inner_join(a, media_data, by ='appid')
    df$release_date <- parse_date_time(df$release_date,orders="ymd")
    df$owners <- str_remove(df$owners, "[0-9]*\\-")
    df["owners"] <- lapply(df["owners"], function(x) as.numeric(x))
    df$screenshots <- NULL
    df$steamspy_tags <- NULL
    
    year_df <- df %>% 
        group_by(year(release_date))
    
    names(year_df)[names(year_df) == "year(release_date)"] <- "Year"
    
    # table by year
    summ_year <- year_df  %>% summarise(
        cantidad_juegos = length(appid),
        precio_promedio = mean(price),
        rating_positivo = sum(positive_ratings),
        rating_negativo = sum(negative_ratings),
        cantidad_jugadores = sum(owners),
        promedio_jugando_min = mean(average_playtime),
        ingresos = sum(owners * price)
    )
    
    
    
    p<-ggplot(data=summ_year, aes(x=Year, y=ingresos)) +
        geom_bar(stat="identity", fill="steelblue")+
        theme_minimal()
    
    # Server Functions Shiny
    # Return the requested dataset ----
    datasetInput <- reactive({
        switch(input$dataset,
               "Steam" = data,
               "Steam description" = description_data,
               "steam Media" = media_data)
    })
    
    # Show the first "n" observations ----
    output$view <- renderTable({
        head(datasetInput(), n = input$obs)
    },   hover = TRUE, colnames = TRUE)
    
    
    # 
    output$n_games <- renderText({ 
        length(unique(df$appid))
    })
    output$n_publisher <- renderText({ 
        length(unique(df$publisher))
    })
    output$n_dev <- renderText({ 
        length(unique(df$developer))
    })
    output$n_genre <- renderText({ 
        '11'
    })
    output$n_plat <- renderText({ 
        '3: Windows, Mac, Linux'
    })
    output$n_avg <- renderText({ 
        mean(df$average_playtime)
    })
    output$n_Price <- renderText({ 
        '0 - 421.99'
    })
    output$n_year <- renderText({ 
        '1997 - 2019'
    })
    
    
    # Show the first "n" observations ----
    
    output$plot_year <- renderPlot({
        p
    })
    output$info <- renderText({
        year_select <- input$plot_click$x
        print(year_select)
        if(!is.null(year_select)){
            as <- floor(year_select)
            income <- filter(summ_year, Year == as)
            
            
            output$df_year <- renderTable({
                income
            },   hover = TRUE, colnames = TRUE)
            
            
            paste0("Year = ", as, "\nIncome = ", income$ingresos)
            
            
        }else{
            paste0("Select a bar to see more information \nYear = \nIncome = ")   
        }
    })
    
    colum <- c(1, 2, 3, 5, 6, 7, 10,12,13,14, 16,17)
    output$df_final <- DT::renderDataTable({
        DT::datatable(df[,colum],
                      filter = 'top',
                      options = list(
                          pageLength = 5,
                          lengthMenu = c(5, 10, 15, 20)
                      )
                      
        ) }, selection = 'single', server = TRUE
        
    )
    
    
    output$vacio <- renderText({
        if(length(input$df_final_rows_selected) != 1){
            paste0("Select ONLY one row to see the description")
            
        } else {
            ""
        }
    })
    
    
    
    output$game_title <- renderText({
        if(length(input$df_final_rows_selected) == 1) {
            er <- df[input$df_final_rows_selected,]
            paste0(er$name)
        }
    })
    
    output$description_game <- renderText({
        if(length(input$df_final_rows_selected) == 1) {
            er <- df[input$df_final_rows_selected,]
            paste0(er$detailed_description)
        }
    })
    
    output$image <- renderUI({
        if(length(input$df_final_rows_selected) == 1) {
            tags$img(src = df$header_image[input$df_final_rows_selected])
        }
    })
    
    
    
    output$plot_f <- renderPlot({
        ased <- filter(df, price <= 100)
        plot(ased$price, ased$owners, main='Price vs Owners', xlab="Price", ylab="Owners")
    })
    
    
    output$plot_1 <- renderPlot({
        
        data <- data.frame(
            group=c('Free %', 'Paid %'),
            value=c(9.5,90.5)
        )
        
        # Compute the position of labels
        data <- data %>% 
            arrange(desc(group)) %>%
            mutate(prop = value / sum(data$value) *100) %>%
            mutate(ypos = cumsum(prop)- 0.5*prop )
        
        # Basic piechart
        ggplot(data, aes(x="", y=prop, fill=group)) +
            geom_bar(stat="identity", width=1, color="white") +
            coord_polar("y", start=0) +
            theme_void() + 
            theme(legend.position="none") +
            
            geom_text(aes(y = ypos, label = group), color = "white", size=6) +
            scale_fill_brewer(palette="Set1")
        
        
    })
    
    
    
    
    
    output$plot_2 <- renderPlot({
        
        data <- data.frame(
            group=c('NON-English %', 'English %'),
            value=c(2,98)
        )
        
        # Compute the position of labels
        data <- data %>% 
            arrange(desc(group)) %>%
            mutate(prop = value / sum(data$value) *100) %>%
            mutate(ypos = cumsum(prop)- 0.5*prop )
        
        # Basic piechart
        ggplot(data, aes(x="", y=prop, fill=group)) +
            geom_bar(stat="identity", width=1, color="white") +
            coord_polar("y", start=0) +
            theme_void() + 
            theme(legend.position="none") +
            
            geom_text(aes(y = ypos, label = group), color = "white", size=6) +
            scale_fill_brewer(palette="Set1")
        
        
        
        
        
        
        
        
        
    })

    
    
    observeEvent(input$update, {
        isolate(
        output$uu <- renderTable({
            aasw <- filter(df, genres == input$ggg)
            head(aasw, n = 10)
        },   hover = TRUE, colnames = TRUE)
        )
    })
    
   
    #plot(df$owners, df$price)
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
