#!/bin/env bash

if [ ! -e /opt/first ]
then
    cd EPGStation
    cp config/config.yml.template config/config.yml
    cp config/operatorLogConfig.sample.yml config/operatorLogConfig.yml
    cp config/epgUpdaterLogConfig.sample.yml config/epgUpdaterLogConfig.yml
    cp config/serviceLogConfig.sample.yml config/serviceLogConfig.yml
    cp config/enc.js.template config/enc.js
    sed -i -e "s/mirakurunPath: http+unix:\/\/%2Fvar%2Frun%2Fmirakurun\.sock\//mirakurunPath: http:\/\/${MIRAKURUN_ENDPOINT}/" config/config.yml
    touch /opt/first
fi


cd /opt/EPGStation
npm start