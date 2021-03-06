
library(shiny)


shinyUI(fluidPage(

    
    titlePanel("Old Faithful Geyser Data"),

    tabsetPanel(tabPanel("plot",
                         h1("Graficas en shiny"),
                         plotOutput("grafica_base_r"),
                         plotOutput("grafica_ggplot")
                         ),
                tabPanel("plot click",
                         plotOutput("click_base_plot",click="plot_click"),
                         verbatimTextOutput("click_base_plot_xy"),
                         plotOutput("click_ggplot",click="ggplot_click"),
                         verbatimTextOutput("ggplot_click_xy")
                         ),
                tabPanel("Todas las opciones",
                         plotOutput("plot_click_option",
                                    click = 'clk',
                                    dblclick = 'dblclick',
                                    hover = 'hover',
                                    brush = 'brush'   ),
                         verbatimTextOutput("all_click_options")
                        ),
                tabPanel("tarea",
                         plotOutput("plot",
                                    click = "plot_click",
                                    dblclick = "plot_dblclick",
                                    hover = "plot_hover",
                                    brush = "plot_brush"),
                         verbatimTextOutput("one"),
                         verbatimTextOutput("multiple")
                )
                )
    
))
