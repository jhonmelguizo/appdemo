# Etapa 1: Compilar la aplicación Spring Boot y generar el archivo JAR
FROM maven:3.6.3-openjdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean install

# Etapa 2: Crear una imagen Docker con el archivo JAR
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/spring-boot-data-jpa-0.0.1-SNAPSHOT.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
