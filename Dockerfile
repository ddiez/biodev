FROM bioconductor/release_core2
MAINTAINER Diego Diez <diego10ruiz@gmail.com>

ADD install.R /tmp/
RUN R -f /tmp/install.R

# Update the repository sources list
RUN apt-get update

## Add MACS2
# Install python, numpy and dependancies to build MACS
RUN apt-get install --yes build-essential git python python-numpy python-dev cython

# Clone MACS repository and checkout the requested tag
RUN cd /tmp && git clone https://github.com/taoliu/MACS.git && cd MACS && git checkout

# Compile and install MACS
RUN cd /tmp/MACS && python setup.py install

# Cleanup
RUN apt-get clean
RUN rm -rf /tmp/MACS
