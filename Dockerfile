FROM wenboliu/docker-ubuntu-vnc-desktop
MAINTAINER Wenbo Liu

RUN rm -rf /etc/apt/sources.list

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y curl build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev
ADD phantomjs-2.1.1-linux-x86_64 /usr/local/share/phantomjs-2.1.1-linux-x86_64
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs git && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
