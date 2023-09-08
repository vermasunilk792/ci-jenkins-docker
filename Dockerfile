FROM tomcat:latest

LABEL maintainer="sunil verma"
RUN adduser ubuntu sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN usermod -aG docker ubuntu

RUN chmod 777 /var/run/docker.sock

RUN chown root:ubuntu /var/run/docker.sock
USER ubuntu
ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
