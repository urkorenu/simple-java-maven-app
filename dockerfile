FROM maven:3.8.8-openjdk-17 as stage-1

COPY . .
RUN mvn dependency:go-offline


RUN mvn clean package --file pom.xml

FROM openjdk:17-slim as stage-2

COPY --from=stage-1 /home/runner/work/simple-java-maven-app/simple-java-maven-app/target/my-app-*.jar /home/runner/work/simple-java-maven-app/simple-java-maven-app/target/my-app-*.jar


CMD ["java", "-jar", "/home/runner/work/simple-java-maven-app/simple-java-maven-app/target/my-app-*.jar"]
