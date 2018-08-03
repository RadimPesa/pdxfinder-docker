FROM debian:stretch

LABEL maintainer="pesa@ics.muni.cz"

RUN apt-get update \
    && apt-get install -y openjdk-8-jdk \
    && apt-get install -y git \
    && apt-get install -y maven
ADD https://api.github.com/repos/PDXFinder/PDXFinder/git/refs/heads/dev version.json
RUN git clone --depth 1 -b dev https://github.com/PDXFinder/pdxfinder
RUN echo "spring.data.neo4j.uri=http://neo4j:7474" >> /pdxfinder/web/src/main/resources/application.properties
#RUN sed -i "s/spring.data.neo4j.uri=.*/spring.data.neo4j.uri=http:\/\/neo4j:7474/" /pdxfinder/indexer/src/main/resources/application.properties

WORKDIR /pdxfinder
RUN mvn clean package
WORKDIR /pdxfinder/web/target

CMD ["java","-jar","web-1.0.0.jar"]
