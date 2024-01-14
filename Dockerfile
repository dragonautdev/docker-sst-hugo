FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y install sshpass
RUN apt-get -y install apt-transport-https
RUN apt-get -y install openssl
RUN apt-get -y install zip
RUN apt-get -y install curl
RUN apt-get -y install openssh-client
RUN apt-get -y install git
RUN curl -OL https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
RUN sha256sum go1.21.6.linux-amd64.tar.gz
RUN tar -C /usr/local -xf go1.21.6.linux-amd64.tar.gz
ENV PATH /usr/local/go/bin:$PATH
RUN curl -OL https://github.com/gohugoio/hugo/releases/download/v0.121.2/hugo_extended_0.121.2_linux-amd64.deb
RUN dpkg -i hugo_extended_0.121.2_linux-amd64.deb
RUN go version
RUN hugo version
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y python3-pip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli
RUN echo $(which aws)
RUN echo $(aws --version)