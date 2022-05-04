FROM dongzhuoer/rlang:bookdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install r-cran-blogdown && rm -r /var/lib/apt/lists/
COPY hugo /bin/
