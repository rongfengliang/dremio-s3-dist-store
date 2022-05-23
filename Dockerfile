FROM  dremio/dremio-oss:21.1
USER root
COPY dremio-env-profile /opt/dremio/conf/dremio-env
COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas
COPY core-site.xml /opt/dremio/conf/core-site.xml
COPY dremio.conf /opt/dremio/conf/dremio.conf
COPY jprofiler_linux_12_0_4.deb /opt/jprofiler_linux_12_0_4.deb
RUN dpkg -i /opt/jprofiler_linux_12_0_4.deb
COPY my-mysql-19.0.0-202110270341120595-3e3e05e7.jar /opt/dremio/jars/my-mysql-19.0.0-202110270341120595-3e3e05e7.jar
COPY mysql-connector-java-5.1.47.jar /opt/dremio/jars/3rdparty/mysql-connector-java-5.1.47.jar
COPY mysql-connector-java-8.0.20.jar /opt/dremio/jars/3rdparty/mysql-connector-java-8.0.20.jar
USER dremio