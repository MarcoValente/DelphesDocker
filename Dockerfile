FROM rootproject/root-ubuntu16:latest
USER root

WORKDIR /app

# Install useful apps
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
    wget \
    python-pip \
    cmake

# Install python packages
RUN pip install --upgrade pip

#Download Delphes 3.4.1
RUN wget http://cp3.irmp.ucl.ac.be/downloads/Delphes-3.4.1.tar.gz
RUN tar -zxf Delphes-3.4.1.tar.gz \
    && mv Delphes-3.4.1/* . \
    && rm -r Delphes-3.4.1*

#Install Delphes
RUN make -j 4