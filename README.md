# eSchool AWS Deployment with Terraform

This project deploys the eSchool Spring Boot application on AWS using Terraform.

Infrastructure includes:

- VPC
- Public subnet
- Internet Gateway
- EC2 instance for Web application
- EC2 instance for MySQL database
- Security Groups
- SSH key generation

---

# Environment setup

Install locally:

- Terraform
- AWS CLI
- Make
- Git

Configure AWS:
aws configure
- Access Key
- Secret key

---

# Deployment

Initialize
```bash
make init
```
Plan
```bash
make plan
```

Apply
```bash
make apply
```
Destroy infrastructure:
```bash
make destroy
```
---

# SSH Connection

Private key is generated automatically in:

.keys/tech-task-key

Connect to instance:

ssh -i .keys/tech-task-key ubuntu@instance_ip

---

# Configure Database instance:

Dependencies:
- mysql-server

Configuration:

Change bind_address to 0.0.0.0

```bash
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
```
---

# Build Application

Dependencies:

- Openjdk-8-jdk
- Maven
- Git

Clone repository:
https://github.com/yurkovskiy/eSchool

Build and run:
```bash
cd eSchool

mvn clean

mvn package

java -jar target/eschool.jar
```

# Run as systemd service 

Create file 

/etc/systemd/system/eschool.service
```bash
sudo systemctl daemon-reload

sudo systemctl enable eschool

sudo systemctl start eschool

sudo systemctl status eschool
```
---

# Access to App:

http://"web-public-ip":8080




