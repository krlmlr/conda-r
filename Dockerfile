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
