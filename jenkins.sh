# used amazon linux 2
#STEP-1: INSTALLING GIT JAVA-1.8.0 MAVEN 
yum install git java-1.8.0-openjdk maven -y

#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#STEP-3: DOWNLOAD JAVA11 AND JENKINS
sudo yum install java-17-amazon-corretto -y
yum install jenkins -y
update-alternatives --config java

#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
systemctl status jenkins.service



#Updated setup of jenkins server
#!/bin/bash

# Script to install Jenkins on Amazon Linux 2

# STEP 1: Update the system and install dependencies
echo "Updating the system and installing Git, Java 17, and Maven..."
sudo yum update -y
sudo yum install git java-17-amazon-corretto maven -y

# STEP 2: Add Jenkins repository and import the key
echo "Adding Jenkins repository..."
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# STEP 3: Install Jenkins
echo "Installing Jenkins..."
sudo yum install jenkins -y

# STEP 4: Set default Java version (optional if multiple versions are installed)
echo "Setting Java 17 as the default..."
sudo update-alternatives --set java /usr/lib/jvm/java-17-amazon-corretto.x86_64/bin/java

# STEP 5: Start and enable Jenkins
echo "Starting and enabling Jenkins service..."
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

# STEP 6: Check Jenkins status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins.service

# STEP 7: Open firewall port for Jenkins (if needed)
echo "Opening port 8080 for Jenkins..."
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload

# STEP 8: Display Jenkins unlock password
echo "Jenkins has been installed. Retrieve the initial admin password below:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo ""
echo "You can access Jenkins at: http://<your-server-ip>:8080"

