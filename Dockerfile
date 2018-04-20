FROM maven:3.5.3-jdk-8 as builder

LABEL maintainer="andrey.mikhalchuk@conceptant.com"
LABEL version="0.0.1.1"
LABEL description="This Dockerfile builds HAPI FHIR, see details here: http://hapifhir.io/, http://hl7.org/fhir/"
LABEL "com.conceptant.vendor"="Conceptant, Inc."

RUN git clone https://github.com/jamesagnew/hapi-fhir.git
WORKDIR /hapi-fhir/hapi-fhir-jpaserver-example
RUN mvn package -Dmaven.test.skip=true

FROM jetty:9-jre8-alpine as runner
USER jetty:jetty
VOLUME /data
COPY --from=builder /hapi-fhir/hapi-fhir-jpaserver-example/target/hapi-fhir-jpaserver-example.war /var/lib/jetty/webapps/root.war
EXPOSE 8080
