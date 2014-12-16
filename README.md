#opentsdb docker container
simple opentsdb docker container for version 2.0.1

######Pull from Docker Hub
    docker pull allen13/opentsdb
######Build Image
    make
######Shell into container
    make shell
######Run Image with Hbase ZooKeeper host info
    docker run -e HBASE_ZK=your-hbase-zk-node:2181 allen13/opentsdb
