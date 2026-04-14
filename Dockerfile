FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
ADD . /app
RUN mvn package


FROM eclipse-temurin:17-jdk-jammy AS runtime
LABEL projectname="java-spc"
ARG username=devops
RUN useradd -m -d /home/${username} ${username} -s /bin/bash
COPY --from=build /app/target/*.jar app.jar
USER ${username}
WORKDIR /app
EXPOSE 8080
CMD ["java","-jar","app.jar"]