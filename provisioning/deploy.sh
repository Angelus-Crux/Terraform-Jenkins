#!/bin/sh

# install java, git and wget
sudo yum -y install install java-1.8.0-openjdk*
sudo yum -y install wget
sudo yum -y install git

# download maven to /opt and set MAVEN_HOME and PATH
sudo wget -P /opt http://apache.mirrors.nublue.co.uk/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
sudo mv /tmp/mvnpath.sh /etc/profile.d
sudo chmod +x /etc/profile.d/mvnpath.sh

# Install jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y install jenkins
