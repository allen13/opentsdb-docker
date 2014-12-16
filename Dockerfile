FROM ubuntu

RUN if [ ! $(grep universe /etc/apt/sources.list) ]; then sed 's/main$/main universe/' -i /etc/apt/sources.list && apt-get update; fi
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update

#Install OpenTSDB and requirements
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget openjdk-6-jdk gnuplot
RUN wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.0.1/opentsdb-2.0.1_all.deb -O /tmp/opentsdb.deb
RUN dpkg -i /tmp/opentsdb.deb
RUN rm /tmp/opentsdb.deb

EXPOSE 4242

CMD /usr/share/opentsdb/bin/tsdb tsd --zkquorum=$HBASE_ZK
