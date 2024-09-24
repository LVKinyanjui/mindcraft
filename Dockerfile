FROM ubuntu:22.04

# Make bash the default(?) shell
# Essential for running .bashrc
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install java and other and its dependencies
RUN apt-get update \
    && apt-get install -y \
    openjdk-8-jdk \ 
    curl \
    wget \

    && rm -rf /var/lib/apt/lists/*

# Install Minecraft Java Edition
RUN wget https://launcher.mojang.com/download/Minecraft.deb
RUN dpkg -i ./Minecraft.deb
RUN apt -f install

# Install node and its dependencies
ENV NODE_VERSION=16.13.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
# RUN node --version
# RUN npm --version

CMD ["minecraft-launcher"]
