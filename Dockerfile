FROM maven:3.5.3-jdk-8 as builder

LABEL maintainer="andrey.mikhalchuk@conceptant.com"
LABEL version="0.0.1.2"
LABEL description="This Dockerfile builds HAPI FHIR, see details here: http://hapifhir.io/, http://hl7.org/fhir/"
LABEL "com.conceptant.vendor"="Conceptant, Inc."

RUN git clone https://github.com/jamesagnew/hapi-fhir.git
COPY templates/about.html /hapi-fhir/hapi-fhir-jpaserver-example/src/main/webapp/WEB-INF/templates/about.html
COPY templates/tmpl-home-welcome.html /hapi-fhir/hapi-fhir-jpaserver-example/src/main/webapp/WEB-INF/templates/tmpl-home-welcome.html
WORKDIR /hapi-fhir/hapi-fhir-jpaserver-example
RUN mvn package -Dmaven.test.skip=true

FROM jetty:9-jre8-alpine as runner
USER jetty:jetty
COPY --from=builder /hapi-fhir/hapi-fhir-jpaserver-example/target/hapi-fhir-jpaserver-example.war /var/lib/jetty/webapps/root.war
EXPOSE 8080
