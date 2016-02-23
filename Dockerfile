## Emacs, make this -*- mode: sh; -*-

########################################################
##                                                    ##
## If creating your own image, edit the two entries   ##
## below, and the PACKAGES file                       ##
##                                                    ##
########################################################

## Choose your base image, e.g., rocker/drd:latest or rwercker/base:latest
FROM ubuntu:latest

## Edit maintainer information as appropritate
MAINTAINER "Kirill Müller" krlmlr+github@mailbox.org

RUN apt-get update

RUN apt-get install -y curl

RUN curl -O https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh

RUN chmod +x Miniconda-latest-Linux-x86_64.sh

RUN ./Miniconda-latest-Linux-x86_64.sh -b

ENV PATH /root/miniconda2/bin:$PATH

RUN conda install -c r r r-devtools

RUN conda install -c r r-bh r-rcpp

RUN apt-get install -y build-essential

RUN apt-get install -y unzip

RUN apt-get install -y libpq-dev

RUN Rscript -e "httr::set_config( httr::config( ssl_verifypeer = 0L ) ); devtools::install_github(c('rstats-db/DBI'), dep = FALSE)"

RUN Rscript -e "httr::set_config( httr::config( ssl_verifypeer = 0L ) ); devtools::install_github(c('rstats-db/RPostgres'), dep = FALSE)"
