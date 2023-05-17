ARG CUDA_VER=11.4.2
ARG LINUX_VER=ubuntu20.04
ARG PYTHON_VER=3.8
ARG RAPIDS_VER=21.10
ARG FROM_IMAGE=nvidia/cuda

FROM ${FROM_IMAGE}:${CUDA_VER}-base-${LINUX_VER}

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    vim \
 && rm -rf /var/lib/apt/lists/*

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user
# && chown -R user:user 
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN chmod 777 /home/user

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

# Install Miniconda and Python 3.8
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV PATH=/home/user/miniconda/bin:$PATH
RUN curl -sLo ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh 
#  && conda install -y python==3.8.3 \
#  && conda clean -ya

# CUDA 11.1-specific steps
RUN conda create -n rapids -c rapidsai -c nvidia -c conda-forge \
    cudf=${RAPIDS_VER} \
    cuSignal=${RAPIDS_VER} \
    cuxfilter=${RAPIDS_VER} \
    python=3.8 \
    cudatoolkit=${CUDA_VER}
COPY requirement-gpu.txt /
RUN pip install -r requirement-gpu.txt
RUN conda
RUN conda clean -ya

# Jupyter notebook port #
EXPOSE 8891
# Dask Scheduler Bokeh port
EXPOSE 8787
EXPOSE 8786
# Dash port
EXPOSE 8050

# Set the default command to pass to the ENTRYPPOINT if no command was given
CMD ["/bin/bash"]
