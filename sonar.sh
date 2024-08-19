#! /bin/bash
#Launch an instance with 9000 and t2.medium
cd /opt/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip
unzip sonarqube-9.9.0.65466.zip
amazon-linux-extras install java-openjdk11 -y
useradd sonar
chown sonar:sonar sonarqube-9.9.0.65466 -R
chmod 777 sonarqube-9.9.0.65466 -R
su - sonar

#run this on server manually
#sh /opt/sonarqube-9.9.0.65466/bin/linux/sonar.sh start
#echo "user=admin & password=admin"
