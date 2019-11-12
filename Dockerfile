#Dockerfile

FROM bharaniravikanth/ubuntu-eric:initial-commit

MAINTAINER "Bharani Ravi Kanth R"

RUN apt-get update

RUN apt-get -y install vim

RUN apt-get -y install telnet

RUN apt-get -y install nano

#RUN mkdir /opt/jdk

#COPY jdk /opt/jdk

#RUN ls -lrt /opt/lib/

RUN adduser bharani

RUN echo 'bharani:bharani' |chpasswd

RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN mkdir /home/bharani/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
