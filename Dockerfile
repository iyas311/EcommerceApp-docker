# Build Stage
FROM maven:3.8.5-openjdk-8-slim AS build
WORKDIR /app
COPY EcommerceApp/pom.xml .
RUN mvn dependency:go-offline
COPY EcommerceApp/src ./src

RUN mvn clean package -DskipTests

# Run Stage
FROM tomcat:9.0-jdk8-openjdk-slim
WORKDIR /usr/local/tomcat/webapps
# Copy the built WAR and rename to ROOT.war to serve at /
COPY --from=build /app/target/EcommerceApp.war ./ROOT.war
# Copy the SQLite database file if it exists (for default behavior)
COPY EcommerceApp/mydatabase.db /usr/local/tomcat/mydatabase.db

EXPOSE 8080
CMD ["catalina.sh", "run"]
