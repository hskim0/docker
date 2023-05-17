FROM continuumio/anaconda3

WORKDIR /build

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 

COPY requirement.txt /build

RUN apt-get update && \
    apt-get install -y --no-install-recommends\
        vim \
        git \
        wget \
        curl \
        htop \
        rsync

RUN pip install -r requirement.txt

RUN rm -rf /build

EXPOSE 8501