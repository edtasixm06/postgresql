FROM fedora:27
LABEL author="@edt ASIX M06-ASO"
LABEL description="Postgresql server 2018-2019"
RUN dnf -y install postgresql postgresql-server postgresql-libs rpcbind
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/startup.sh /opt/docker/install.sh
WORKDIR /opt/docker
CMD [ "/opt/docker/startup.sh" ]

