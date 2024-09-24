FROM ubuntu:22.04

# Install Minecraft Java Edition
# and its dependencies
RUN apt-get update 
RUN apt-get install -y openjdk-8-jdk 
RUN rm -rf /var/lib/apt/lists/*

CMD ["java", "-version"]