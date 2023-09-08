FROM tomcat:latest

LABEL maintainer="sunil verma"
RUN adduser jenkins sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN usermod -aG docker jenkins

RUN chmod 777 /var/run/docker.sock

RUN chown root:jenkins /var/run/docker.sock
USER jenkins
ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
