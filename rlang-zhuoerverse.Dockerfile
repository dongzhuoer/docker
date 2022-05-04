FROM rocker/r-ubuntu:20.04

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install r-cran-tidyverse && rm -r /var/lib/apt/lists/
RUN apt update && apt -y install r-cran-patchwork && rm -r /var/lib/apt/lists/
