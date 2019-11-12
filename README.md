# Containerizing Ubuntu with Docker for Stable Deployments

## bharaniravikanth/ubuntu-eric:initial-commit

Initial commit hold the image of actual Ubuntu  docker images which is pulled from ubuntu docker hub registry.  

<code> docker pull ubuntu </code>

## bharaniravikanth/ubuntu-eric:ssh-release-master

ssh-release-master holds the commit of the image, with OpenSSH-server Service

#### Dockerfile commands for reference 

```
FROM bharaniravikanth/ubuntu-eric:initial-commit 

MAINTAINER "Bharani Ravi Kanth R"

RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
```

Execute the below docker command to clone this  image into your local system

<code> docker pull bharaniravikanth/ubuntu-eric:ssh-release-master </code>


##### Note: you can access the Dockerfile from https://github.com/bharaniravikanth/docker-ubuntu (this is a private repository, send a collaborator request for accessing the private github repository) 