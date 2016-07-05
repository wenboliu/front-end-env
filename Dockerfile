FROM wenboliu/docker-ubuntu-vnc-desktop
MAINTAINER Wenbo Liu

RUN rm -rf /etc/apt/sources.list

COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y build-essential
RUN apt-get install -y chrpath
RUN apt-get install -y libssl-dev
RUN apt-get install -y libxft-dev
RUN apt-get install -y libfreetype6
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libfontconfig1
RUN apt-get install -y libfontconfig1-dev
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y git
RUN apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

ADD phantomjs-2.1.1-linux-x86_64 /usr/local/share/phantomjs-2.1.1-linux-x86_64
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

CMD ["/bin/bash"]
