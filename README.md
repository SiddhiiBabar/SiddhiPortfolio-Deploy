# 🚀 Portfolio Deployment using GitHub, Jenkins, Docker & AWS

## 📌 Project Overview

This project demonstrates a simple CI/CD pipeline to deploy my portfolio website using GitHub, Jenkins, Docker and AWS EC2, with S3 used for backup.

### 🔄 Workflow

```text
Developer
   ↓
GitHub
   ↓
GitHub Actions
   ↓
GitHub Webhook
   ↓
Jenkins
   ↓
Docker Build & Deploy
   ↓
AWS EC2
   ↓
Nginx
   ↓
Portfolio
   ↓
S3 Backup
```

## 🛠️ Technologies

- Git & GitHub
- GitHub Actions
- GitHub Webhook
- Jenkins
- Docker
- Nginx
- AWS EC2
- Amazon S3
- IAM
- AWS CLI
- HTML & CSS

## 📁 Project Structure

```text
SiddhiPortfolio-Deploy/
├── index.html
├── style.css
├── Dockerfile
├── Jenkinsfile
└── README.md
```

## 🔧 Git Commands

```bash
git status
git add .
git commit -m "Update portfolio"
git push origin main
```

## 🐳 Docker

### Build image

```bash
docker build -t siddhi-portfolio .
```

### Run container

```bash
docker run -d --name siddhi-portfolio -p 8081:80 siddhi-portfolio
```

### Check container

```bash
docker ps
```

Portfolio:

```text
http://EC2-PUBLIC-IP:8081
```

## 🔨 Jenkins Pipeline

Jenkins gets the code from GitHub and performs:

```text
Checkout
   ↓
Docker Build
   ↓
Docker Deploy
   ↓
S3 Backup
```

The pipeline is defined in `Jenkinsfile`.

GitHub Webhook:

```text
http://EC2-PUBLIC-IP:8080/github-webhook/
```

## ☁️ AWS

### EC2

Used to run:

- Jenkins
- Docker
- Portfolio container

### S3

Used to store deployment backups.

Example:

```bash
aws s3 cp portfolio-backup.zip s3://BUCKET-NAME/backups/
```

### IAM

IAM credentials are stored securely in Jenkins Credentials and are not stored in GitHub.

## ❌ Errors Faced & Troubleshooting

### 1. Jenkinsfile Not Found

```text
ERROR: Unable to find jenkinsfile from git
```

**Reason:** Jenkins could not find the Jenkinsfile in the configured branch/repository.

**Solution:** Added `Jenkinsfile` to GitHub and configured:

```text
Branch: */main
Script Path: Jenkinsfile
```

### 2. Docker Port Already Allocated

```text
Bind for :::8081 failed: port is already allocated
```

**Reason:** Port 8081 was already used by another container.

**Commands:**

```bash
docker ps
docker stop <container-name>
docker rm <container-name>
```

### 3. S3 Credentials Error

```text
Unable to locate credentials
```

**Reason:** Jenkins could not find AWS credentials.

**Solution:** Added AWS Access Key and Secret Key in Jenkins Credentials and used an IAM user for S3 access.

## 🧠 Key Learnings

- Git and GitHub
- CI/CD with Jenkins
- GitHub Webhooks
- Docker containerization
- AWS EC2 deployment
- Nginx
- S3 backup
- IAM and secure credentials
- Real-world troubleshooting

## 👩‍💻 Author

**Siddhi Babar**

Cloud & DevOps Learner

**GitHub:** https://github.com/SiddhiiBabar/SiddhiPortfolio-Deploy
