FROM ubuntu:latest

ENV MIRAKURUN_ENDPOINT="10.24.0.102:40772"

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
    cp config/config.yml.template config/config.yml && \
    cp config/operatorLogConfig.sample.yml config/operatorLogConfig.yml && \
    cp config/epgUpdaterLogConfig.sample.yml config/epgUpdaterLogConfig.yml && \
    cp config/serviceLogConfig.sample.yml config/serviceLogConfig.yml && \
    cp config/enc.js.template config/enc.js && \
    sed -i -e "s/mirakurunPath: http+unix:\/\/%2Fvar%2Frun%2Fmirakurun\.sock\//mirakurunPath: http:\/\/${MIRAKURUN_ENDPOINT}/" config/config.yml

RUN echo "endpoint is ${MIRAKURUN_ENDPOINT}"

COPY start.sh .
RUN chmod 700 start.sh

ENTRYPOINT [ "/opt/start.sh" ]