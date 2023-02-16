FROM ubuntu:latest

WORKDIR /opt

RUN apt update && \
    apt install -y ffmpeg build-essential curl python3 git
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt install -y nodejs

RUN npm install pm2 -g

RUN git clone https://github.com/l3tnun/EPGStation.git && \
    cd EPGStation && \
    npm run all-install && \
    npm run build

RUN cd EPGStation && \ 
    mv config config_template

ENV MIRAKURUN_ENDPOINT="mirakc.pve.localdomain:40772"

RUN echo "endpoint is ${MIRAKURUN_ENDPOINT}"

COPY start.sh .
RUN chmod 700 start.sh

ENTRYPOINT [ "/opt/start.sh" ]
