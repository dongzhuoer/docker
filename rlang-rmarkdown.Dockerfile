FROM dongzhuoer/rlang:zhuoerverse

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install r-cran-rmarkdown && rm -r /var/lib/apt/lists/
RUN apt update && apt -y install r-cran-prettydoc && rm -r /var/lib/apt/lists/
COPY pandoc /bin/
