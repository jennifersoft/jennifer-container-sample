FROM ubuntu:20.04

# 환경 설정
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk zip ant tzdata && \
    apt-get clean;
RUN DEBIAN_FRONTEND="noninteractive"

# Jennifer server 설치
## TODO: 알맞는 서버 버전 입력
ENV JENNIFER_SERVER_VERSION='5.6.1.8'

COPY jennifer-server-${JENNIFER_SERVER_VERSION}.zip /opt
RUN cd /opt && unzip jennifer-server-${JENNIFER_SERVER_VERSION}.zip
RUN cd /opt && unzip jennifer-data-server-${JENNIFER_SERVER_VERSION}.zip 
RUN cd /opt && unzip jennifer-view-server-${JENNIFER_SERVER_VERSION}.zip 
## jennifer view 서버의 퍼스펙티브 변경하기 위해
COPY ./jennifer_view.sh /opt/server.view/bin/jennifer_view.sh

## 발급된 라이센스 파일 지정 (일반적으로 이미지로 넣지 않고 볼륨 연결 함)
# RUN mkdir /opt/server.data/conf/license
# COPY ./license /opt/server.data/conf/license

## Jennifer 성능 데이터 저장소 (영구 저장소로 사용하기 때문에 볼륨 연결 함)
# RUN mkdir /opt/server.data/db_data
# COPY ./db_data /opt/server.data/db_data

# Exposing Jennifer port to host
EXPOSE 7900 5000

COPY run.sh /usr/local
CMD ["/usr/local/run.sh"]
