# get shiny serves plus tidyverse packages image
FROM rocker/shiny-verse:latest

RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev 

RUN apt-get update && apt-get install -y \
    libmpfr-dev


RUN R -e "install.packages(c('shiny', 'readr', 'dplyr', 'rsconnect', 'DT', 'pool', 'lubridate', 'stringr', 'shinyWidgets', 'shinydashboard', 'shinythemes','tidyverse','shinymaterial','rsconnect'))"

COPY /lab/ /srv/shiny-server/


