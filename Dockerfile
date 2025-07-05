# Use Amazon Corretto 8 with Tomcat 9
FROM tomcat:9.0.97-jdk8-corretto

# Remove the default ROOT webapp (optional but avoids conflicts)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your built WAR to Tomcat and rename to ROOT.war
COPY target/mani-todo.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat's default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
