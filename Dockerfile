FROM bioconductor/release_core2
MAINTAINER diego10ruiz@gmail.com

ADD install.R /tmp/
RUN R -f /tmp/install.R