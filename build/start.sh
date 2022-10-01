#!/bin/env bash

if [ ! -e /opt/first ]
then
    cd /opt/EPGStation
    cp config_template/config.yml.template config/config.yml
    cp config_template/operatorLogConfig.sample.yml config/operatorLogConfig.yml
    cp config_template/epgUpdaterLogConfig.sample.yml config/epgUpdaterLogConfig.yml
    cp config_template/serviceLogConfig.sample.yml config/serviceLogConfig.yml
    cp config_template/enc.js.template config/enc.js
    sed -i -e "s/mirakurunPath: http+unix:\/\/%2Fvar%2Frun%2Fmirakurun\.sock\//mirakurunPath: http:\/\/${MIRAKURUN_ENDPOINT}/" config/config.yml
    touch /opt/first
fi

cd /opt/EPGStation
npm start