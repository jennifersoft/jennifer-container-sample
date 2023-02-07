#!/bin/bash

## Server 가동시간 주기 위해 sleep
sleep 10;

## Jennifer Agent 클라우드 배포 방식 설치
echo "Agent download from jennifer server"
cd /opt && wget --content-disposition -O jennifer-agent-java ${JENNIFER_DOWNLOAD_SERVER}/download/agent/java/latest

echo "Agent install in \"/opt\" directory"
## jennifer.conf 파일 덮어쓰기 방지
cd /opt && unzip -n jennifer-agent-java

/usr/local/tomcat/bin/startup.sh
echo "Tomcat start"

/bin/bash