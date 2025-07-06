FROM tomcat:9.0.97-jdk8-corretto

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY target/mani-todo.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
