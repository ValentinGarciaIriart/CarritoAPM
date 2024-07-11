FROM openjdk:11.0.2-jre-slim

# Set the working directory
WORKDIR /app

# Copy the application JAR
COPY target/microservice-kubernetes-demo-order-0.0.1-SNAPSHOT.jar /app/
COPY elastic-apm-agent-1.49.0.jar /app/elastic-apm-agent.jar

# Configuration and start command including the APM agent
CMD ["/usr/bin/java", "-Xmx400m", "-Xms400m", \
  "-javaagent:/app/elastic-apm-agent.jar", \
  "-Delastic.apm.service_name=Order", \
  "-Delastic.apm.secret_token=0FDBagJo9P7xMGxR5M", \
  "-Delastic.apm.server_url=https://4b7bb8b2c33747a2bd0d13d1880435b3.apm.eastus2.azure.elastic-cloud.com:443", \
  "-Delastic.apm.environment=APM", \
  "-Delastic.apm.application_packages=org.example", \
  "-jar", "/app/microservice-kubernetes-demo-order-0.0.1-SNAPSHOT.jar"]

# Expose the port the application runs on
EXPOSE 8080