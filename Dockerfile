FROM maven:3.6.3-openjdk-11-slim

ENV SONAR_RUNNER_HOME=/usr/lib/sonar-scanner

RUN apt-get update && apt-get install -y zip git nodejs

RUN curl --insecure -o ./sonarscanner.zip -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.3.0.2102-linux.zip && \
	unzip sonarscanner.zip && \
	rm sonarscanner.zip && \
	mv sonar-scanner-4.3.0.2102-linux $SONAR_RUNNER_HOME && \
	ln -s $SONAR_RUNNER_HOME/bin/sonar-scanner /usr/local/bin/sonar-scanner

ENTRYPOINT ["sonar-scanner"]