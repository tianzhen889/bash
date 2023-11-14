#!/bin/bash

# 更新系统包列表
sudo yum update -y

# 安装依赖软件包
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 添加Docker存储库
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装Docker引擎
sudo yum install -y docker-ce docker-ce-cli containerd.io

# 启动Docker服务
sudo systemctl start docker

# 将Docker添加到系统启动项中
sudo systemctl enable docker

# 输出安装完成的消息
echo "Docker安装完成！"

# 验证Docker安装
sudo docker run hello-world
