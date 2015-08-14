FROM ukhomeofficedigital/centos-base

RUN yum install -y java-1.7.0-openjdk && \
    yum clean all && \
    mkdir /data /build

ONBUILD WORKDIR /build
ONBUILD COPY . /build
ONBUILD RUN curl -sS \
                  http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz \
                  -o /tmp/apache-maven-3.3.1-bin.tar.gz && \
    tar xvzf /tmp/apache-maven-3.3.1-bin.tar.gz -C /tmp && \
    mv /tmp/apache-maven-3.3.1 /var/local/ && \
    ln -s /var/local/apache-maven-3.3.1/bin/mvnyjp /usr/local/bin/mvnyjp && \
    ln -s /var/local/apache-maven-3.3.1/bin/mvnDebug /usr/local/bin/mvnDebug && \
    ln -s /var/local/apache-maven-3.3.1/bin/mvn /usr/local/bin/mvn && \
    mvn clean install && \
    rm -rf /var/local/apache-maven-3.3.1 \
           /usr/local/bin/mvnyjp \
           /usr/local/bin/mvnDebug \
           /usr/local/bin/mvn \
           /tmp/apache-maven-3.3.1-bin.tar.gz \
           $HOME/.m2 && \
    mv target/*-with-dependencies.jar /data/  && \
    mv configuration.yml /data/configuration.yml && \
    rm -rf /build
ONBUILD WORKDIR /data
ONBUILD ENTRYPOINT java -jar /data/*-with-dependencies.jar
ONBUILD CMD ["server","/data/configuration.yml"]
