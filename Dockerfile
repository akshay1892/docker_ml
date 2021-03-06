FROM tensorflow/tensorflow:latest-gpu-jupyter
#FROM nvidia/cuda:10.2-runtime AS jupyter-base
WORKDIR /
# Install Python and its tools
RUN apt update && apt install -y --no-install-recommends \
    git \
    build-essential \
    python3-dev \
    python3-pip \
    python3-setuptools
RUN apt-get install ffmpeg libsm6 libxext6 -y
RUN pip3 -q install pip --upgrade
# Install all basic packages h
RUN pip3 install \
    # Jupyter itself
    jupyter \
    # Numpy and Pandas are required a-priori
    numpy pandas \
    # PyTorch with CUDA 10.2 support and Torchvision
    torch torchvision \
    # Upgraded version of Tensorboard with more features
    tensorboardX \
    opencv-python \
    keras \
    tensorflow \
    sklearn \
    keras-video-generators
