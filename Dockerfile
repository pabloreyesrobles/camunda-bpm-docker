FROM camunda/camunda-bpm-platform:run-latest

# Add PostgreSQL JDBC driver
ADD postgresql-42.6.2.jar /camunda/lib/

# Add custom configuration for Camunda
COPY bpm-platform.xml /camunda/configuration/
