FROM maven:3.6.3-openjdk-11-slim

ENV SONAR_RUNNER_HOME=/usr/lib/sonar-scanner

RUN apt-get update && \
	apt-get install -y zip git nodejs

ARG APP=sonar-scanner
ARG VERSION=4.4.0.2170
ARG ARCH=linux
RUN curl --insecure -L https://binaries.sonarsource.com/Distribution/${APP}-cli/${APP}-cli-${VERSION}-${ARCH}.zip \
	-o ${APP}.zip && \
	unzip ${APP}.zip && \
	mv ${APP}-${VERSION}-${ARCH} $SONAR_RUNNER_HOME && \
	ln -s $SONAR_RUNNER_HOME/bin/${APP} /usr/local/bin/${APP} && \
	rm -rf ${APP}.zip