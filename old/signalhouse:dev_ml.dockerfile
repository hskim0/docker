ARG FROM_IMAGE=tensorflow/tnesorflow
ARG TF_VER=2.11.0

FROM ${FROM_IMAGE}:${TF_VER}-gpu

RUN pip install jupyter lab