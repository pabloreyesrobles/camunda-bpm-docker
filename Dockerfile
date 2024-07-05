FROM camunda/camunda-bpm-platform:run-latest

# Copy the web.xml to enable authentication
COPY web.xml /camunda/webapps/engine-rest/WEB-INF/web.xml

# Copy the default and production configuration file
COPY default.yml /camunda/configuration/default.yml
COPY production.yml /camunda/configuration/production.yml

# Run the script to create the admin user and then start Camunda
CMD ["/camunda/camunda.sh", "--webapps", "--rest"]