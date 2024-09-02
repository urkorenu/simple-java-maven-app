FROM maven:3.8.3-openjdk-17 as stage-1

COPY . .
RUN mvn dependency:go-offline


RUN mvn clean package --file pom.xml

FROM openjdk:17-slim as stage-2

COPY --from=stage-1 /target/my-app-*.jar /target/my-app-*.jar


CMD ["java", "-jar", "/target/my-app-*.jar"]
