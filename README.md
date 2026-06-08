# DevOps Exercise

## Overview
Infrastructure as Code (IaC) project using Terraform and LocalStack to simulate AWS infrastructure locally.

## Prerequisites
- Terraform
- Docker
- LocalStack
- AWS CLI

## Setup

### 1. Start LocalStack
```bash
docker run -d \
  --name localstack \
  --restart always \
  -p 4566:4566 \
  -e SERVICES=ec2,s3 \
  localstack/localstack:3.0.0
```

### 2. Configure AWS CLI
```bash
aws configure
# Access Key: test
# Secret Key: test
# Region: us-east-1
# Output: json
```

### 3. Run Terraform
```bash
cd phase1
terraform init
terraform apply
```

## Phase 1 - Secure Network
Builds a secure AWS VPC with:
- **VPC**: 10.0.0.0/16
- **Public Subnet**: 10.0.1.0/24 - For public Load Balancer
- **DMZ Subnet**: 10.0.2.0/24 - For Firewall
- **Servers Subnet**: 10.0.3.0/24 - For Web Servers
- **Database Subnet**: 10.0.4.0/24 - For Databases

## Architecture
```
Internet → Public LB → Firewall (DMZ) → Private LB → Servers → DB LB → Database
```
