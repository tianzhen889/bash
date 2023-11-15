vim /opt/zookeeper-3.4.12/conf/zoo.cfg
<!-- zookeeper-3.4.12的zoo.cfg -->
<!-- 修改 -->
clientPort=2181
dataDir=/opt/zookeeper-3.4.12/tmp/data
<!-- 末尾追加 -->
server.1=127.0.0.1:2888:3888
server.2=127.0.0.1:2889:3889
server.3=127.0.0.1:2890:3890
mkdir -p /opt/zookeeper-3.4.12/tmp/data/
echo 1 > /opt/zookeeper-3.4.12/tmp/data/myid
cat /opt/zookeeper-3.4.12/tmp/data/myid
cp -r  /opt/zookeeper-3.4.12/ /opt/zookeeper-3.4.12-01
cp -r  /opt/zookeeper-3.4.12/ /opt/zookeeper-3.4.12-02
cp -r  /opt/zookeeper-3.4.12/ /opt/zookeeper-3.4.12-03
vim /opt/zookeeper-3.4.12-01/conf/zoo.cfg 
<!-- zookeeper-3.4.12-01的zoo.cfg -->
<!-- 仅修改这个就行 -->
dataDir=/opt/zookeeper-3.4.12-01/tmp/data
vim /opt/zookeeper-3.4.12-02/conf/zoo.cfg 
<!-- zookeeper-3.4.12-02的zoo.cfg -->
<!-- 修改 -->
clientPort=2182
dataDir=/opt/zookeeper-3.4.12-02/tmp/data
echo 2 > /opt/zookeeper-3.4.12-02/tmp/data/myid
cat /opt/zookeeper-3.4.12-02/tmp/data/myid
vim /opt/zookeeper-3.4.12-03/conf/zoo.cfg 
<!-- zookeeper-3.4.12-03的zoo.cfg -->
<!-- 修改 -->
clientPort=2183
dataDir=/opt/zookeeper-3.4.12-03/tmp/data
echo 3 > /opt/zookeeper-3.4.12-03/tmp/data/myid
cat /opt/zookeeper-3.4.12-03/tmp/data/myid
# 分别三个启动节点
/opt/zookeeper-3.4.12-01/bin/zkServer.sh start
/opt/zookeeper-3.4.12-02/bin/zkServer.sh start
/opt/zookeeper-3.4.12-03/bin/zkServer.sh start
