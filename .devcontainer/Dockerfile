FROM debian:bookworm

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG FLUTTER_CHANNEL=stable

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************



RUN apt update && export DEBIAN_FRONTEND=noninteractive && apt -y install git curl unzip zsh

RUN apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

# Set the default user.
USER $USERNAME

WORKDIR /home/$USERNAME

ENV PUB_CACHE=/home/$USERNAME/.pub_cache
ENV PATH="/home/$USERNAME/flutter/bin:$PATH"

RUN git clone https://github.com/flutter/flutter --branch $FLUTTER_CHANNEL && \
    /home/$USERNAME/flutter/bin/flutter config --enable-web