FROM tomcat:8.5-jre8-alpine

RUN apk update && apk upgrade
RUN apk add zip

# Exposing Apache port to host
EXPOSE 80


# Jennifer Java Agent 설치
## TODO: 알맞는 에이전트 버전 입력
ENV JENNIFER_AGENT_VERSION='5.5.2.5'
RUN mkdir -p /opt
COPY jennifer-agent-java-${JENNIFER_AGENT_VERSION}.zip /opt
RUN cd /opt && unzip jennifer-agent-java-${JENNIFER_AGENT_VERSION}.zip

## TODO: 설치되는 java 환경에 따라 다른 방법으로 가이드가 필요
## setenv.sh 파일 방식이 모든 자바환경은 아님
ENV APPLICATION_PATH='/usr/local/tomcat/bin'
RUN touch $APPLICATION_PATH/setenv.sh && chmod +x $APPLICATION_PATH/setenv.sh
RUN printf 'AGENT_HOME=/opt/agent.java\n' >> $APPLICATION_PATH/setenv.sh
RUN printf 'export CATALINA_OPTS="$CATALINA_OPTS -javaagent:$AGENT_HOME/jennifer.jar -Djennifer.config=$AGENT_HOME/conf/jennifer.conf"\n' >> $APPLICATION_PATH/setenv.sh

COPY run.sh /usr/local
CMD ["/usr/local/run.sh"]