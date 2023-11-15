#!/bin/bash

# 修改原始zoo.cfg文件
echo "修改原始zoo.cfg文件"
sed -i 's|dataDir=.*|dataDir=/opt/zookeeper-3.4.12/tmp/data|' /opt/zookeeper-3.4.12/conf/zoo.cfg
echo "clientPort=2181" >> /opt/zookeeper-3.4.12/conf/zoo.cfg
echo "server.1=127.0.0.1:2888:3888" >> /opt/zookeeper-3.4.12/conf/zoo.cfg
echo "server.2=127.0.0.1:2889:3889" >> /opt/zookeeper-3.4.12/conf/zoo.cfg
echo "server.3=127.0.0.1:2890:3890" >> /opt/zookeeper-3.4.12/conf/zoo.cfg

# 为第一个节点创建myid文件
echo "为第一个节点创建myid文件"
mkdir -p /opt/zookeeper-3.4.12/tmp/data/
echo 1 > /opt/zookeeper-3.4.12/tmp/data/myid
cat /opt/zookeeper-3.4.12/tmp/data/myid

# 复制三个新节点
echo "复制三个新节点"
cp -r /opt/zookeeper-3.4.12/ /opt/zookeeper-3.4.12-01
cp -r /opt/zookeeper-3.4.12/ /opt/zookeeper-3.4.12-02
cp -r /opt/zookeeper-3.4.12/ /opt/zookeeper-3.4.12-03

# 修改第一个节点的zoo.cfg
echo "修改第一个节点的zoo.cfg"
sed -i 's|dataDir=.*|dataDir=/opt/zookeeper-3.4.12-01/tmp/data|' /opt/zookeeper-3.4.12-01/conf/zoo.cfg

# 修改第二个节点的zoo.cfg
echo "修改第二个节点的zoo.cfg"
sed -i 's|clientPort=.*|clientPort=2182|' /opt/zookeeper-3.4.12-02/conf/zoo.cfg
sed -i 's|dataDir=.*|dataDir=/opt/zookeeper-3.4.12-02/tmp/data|' /opt/zookeeper-3.4.12-02/conf/zoo.cfg

# 第二个节点添加myid文件
echo "第二个节点添加myid文件"
echo 2 > /opt/zookeeper-3.4.12-02/tmp/data/myid
cat /opt/zookeeper-3.4.12-02/tmp/data/myid

# 修改第三个节点的zoo.cfg
echo "修改第三个节点的zoo.cfg"
sed -i 's|clientPort=.*|clientPort=2183|' /opt/zookeeper-3.4.12-03/conf/zoo.cfg
sed -i 's|dataDir=.*|dataDir=/opt/zookeeper-3.4.12-03/tmp/data|' /opt/zookeeper-3.4.12-03/conf/zoo.cfg

# 第三个节点添加myid文件
echo "第三个节点添加myid文件"
echo 3 > /opt/zookeeper-3.4.12-03/tmp/data/myid
cat /opt/zookeeper-3.4.12-03/tmp/data/myid

# 启动三个节点
echo "启动三个节点"
/opt/zookeeper-3.4.12-01/bin/zkServer.sh start
/opt/zookeeper-3.4.12-02/bin/zkServer.sh start
/opt/zookeeper-3.4.12-03/bin/zkServer.sh start