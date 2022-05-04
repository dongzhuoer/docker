# Overview

Docker images for continuous integrating

```bash
for name in $(echo zhuoerverse rmarkdown bookdown blogdown); do docker build -t dongzhuoer/rlang:$name -f rlang-$name.Dockerfile context/rlang-$name; done
name=deverse
docker build -t dongzhuoer/rlang:$name -f rlang-$name.Dockerfile context/rlang-$name
```


# test

```bash
docker run --rm dongzhuoer/rlang:zhuoerverse Rscript -e "library(tidyverse);library(patchwork)"
docker run --rm dongzhuoer/rlang:rmarkdown Rscript -e "library(rmarkdown);library(prettydoc)"
docker run --rm dongzhuoer/rlang:rmarkdown pandoc --version
docker run --rm dongzhuoer/rlang:bookdown Rscript -e "library(bookdown)"
docker run --rm dongzhuoer/rlang:blogdown Rscript -e "library(blogdown)"
docker run --rm dongzhuoer/rlang:blogdown hugo version
```



# may be useful

- test

```
docker run --rm alpine test -f /bin/ls || exit 1
```

- Ubuntu ppa `apt -y install software-properties-common gpg gpg-agent dirmngr`

- install .deb from GitHub release

```dockerfile
# fast APT with tsinghua ipv4 mirror
RUN sed -i 's/archive.ubuntu.com/mirrors4.tuna.tsinghua.edu.cn/' /etc/apt/sources.list \
 && sed -i 's/security.ubuntu.com/mirrors4.tuna.tsinghua.edu.cn/' /etc/apt/sources.list \
 && sed -i 's/archive.canonical.com/mirrors4.tuna.tsinghua.edu.cn/' /etc/apt/sources.list 
# locales
RUN apt update && apt -y install locales && rm -r /var/lib/apt/lists/
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8 
# enable extended glob: http://mywiki.wooledge.org/glob#extglob
RUN echo "\nshopt -s extglob" >> /etc/bash.bashrc
# install latest pandoc
    ## pandoc 2.4 introduce many new feature
    ## and it serves as an example, showing the code for installing GitHub release does work
RUN apt update && apt -y install wget gdebi-core \
    && wget -q -O pandoc.deb https://github.com/jgm/pandoc/releases/download/2.10.1/pandoc-2.10.1-1-amd64.deb && echo y | gdebi pandoc.deb && rm pandoc.deb \
    && apt -y purge wget gdebi-core && apt -y autoremove && rm -r /var/lib/apt/lists/
```
- deverse
  - `pkgload::load_all()`
  - `testthat::test_dir()`
  - `here::here('')` is used to set working directory to project directory
