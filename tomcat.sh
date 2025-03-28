amazon-linux-extras install java-openjdk11 -y
wget https://downloads.apache.org/tomcat/tomcat-11/v11.0.4/bin/apache-tomcat-11.0.4.tar.gz
tar -zxvf apache-tomcat-11.0.4.tar.gz
sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-11.0.4/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-11.0.4/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="raham123" roles="manager-gui, manager-script"/>' apache-tomcat-11.0.4/conf/tomcat-users.xml
sed -i '59  a\</tomcat-users>' apache-tomcat-11.0.4/conf/tomcat-users.xml
sed -i '56d' apache-tomcat-11.0.4/conf/tomcat-users.xml
sed -i '21d' apache-tomcat-11.0.4/webapps/manager/META-INF/context.xml
sed -i '22d'  apache-tomcat-11.0.4/webapps/manager/META-INF/context.xml
sh apache-tomcat-11.0.4/bin/startup.sh
