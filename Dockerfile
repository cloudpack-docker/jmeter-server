FROM cloudpack/centos

RUN yum -y update
RUN yum -y install java-1.8.0-openjdk
RUN yum -y clean all

RUN curl -s -o /usr/local/src/apache-jmeter-2.13.tgz http://ftp.riken.jp/net/apache//jmeter/binaries/apache-jmeter-2.13.tgz
RUN tar xzf /usr/local/src/apache-jmeter-2.13.tgz -C /usr/local

CMD /usr/local/apache-jmeter-2.13/bin/jmeter-server \
    -Dserver.rmi.localport=55501 \
    -Djava.rmi.server.hostname=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`
EXPOSE 1099 55501
