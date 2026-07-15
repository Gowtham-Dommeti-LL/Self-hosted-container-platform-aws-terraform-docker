# Self-Hosted Container Platform on AWS using Terraform and Docker

## Why I Started This Project

In my current role, I work in production support and have exposure to DevOps tools and practices. To improve my hands-on experience, I decided to build this project from scratch instead of only practicing individual Terraform examples.

The idea behind this project is simple. Rather than learning each DevOps tool separately, I wanted to use them together in one project and understand how they fit into a complete deployment workflow.

I'm also documenting each phase of the project so that anyone who is learning Terraform can use this repository as a practical reference instead of just following isolated examples.

---

## Project Goal

The goal of this project is to build a self-hosted container platform on AWS by gradually adding different DevOps tools as the project progresses.

The complete project will include:

- Infrastructure provisioning using Terraform
- Remote Terraform Backend
- Docker
- Docker Compose
- Gitea Git Server
- PostgreSQL
- Nginx Reverse Proxy
- Private Docker Registry
- Deployment Automation using Ansible

---

## Technologies Used

### Completed

- Terraform
- AWS EC2
- AWS S3
- AWS DynamoDB
- Ubuntu Linux

### Upcoming

- Docker
- Docker Compose
- Nginx
- PostgreSQL
- Gitea
- Ansible

---

## Project Structure

```
Self-hosted-container-platform-aws-terraform-docker
│
├── terraform/
│   ├── backend.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── data.tf
│   ├── security_group.tf
│   ├── keypair.tf
│   ├── ec2.tf
│   ├── s3.tf
│   ├── dynamodb.tf
│   └── terraform.tfvars
│
├── README.md
└── .gitignore
```

More folders will be added as the project progresses.

---

# Progress

## Phase 1 - AWS Infrastructure

Completed

- Created the Terraform project structure
- Configured the AWS Provider
- Used Variables and Data Sources
- Provisioned an Ubuntu EC2 instance
- Created a Security Group
- Created an AWS Key Pair
- Connected to the EC2 instance using SSH

---

## Phase 2 - Remote Backend

Completed

- Configured Amazon S3 for storing the Terraform state file
- Configured DynamoDB for Terraform state locking
- Created backend configuration
- Migrated the local state to Amazon S3
- Verified that Terraform is using the remote backend successfully

One thing I found really useful during this phase was understanding how Terraform manages infrastructure through the state file. Creating AWS resources is straightforward, but understanding state management, backend configuration and state locking is equally important when multiple people work on the same infrastructure.

---

## Current Status

### Completed

- [x] Terraform Project Setup
- [x] AWS Provider Configuration
- [x] Variables
- [x] Data Sources
- [x] Ubuntu EC2 Instance
- [x] Security Group
- [x] AWS Key Pair
- [x] SSH Access
- [x] Amazon S3 Remote Backend
- [x] DynamoDB State Locking
- [x] Remote State Migration

### Next

- [ ] Install Docker
- [ ] Install Docker Compose
- [ ] Prepare EC2 as a Docker Host
- [ ] Deploy Nginx
- [ ] Deploy PostgreSQL
- [ ] Deploy Gitea
- [ ] Configure Private Docker Registry
- [ ] Automate deployment using Ansible

---

## What This Project Helped Me Reinforce

Although I already had exposure to DevOps concepts in my work, building this project helped me apply them in a practical way and understand the reasoning behind each step.

So far, this project has helped me reinforce:

- Terraform project structure
- AWS infrastructure provisioning
- Terraform state management
- Remote backend configuration
- Amazon S3 Backend
- DynamoDB State Locking
- Terraform workflow (`init`, `plan`, `apply`, `destroy`)
- Reading Terraform execution plans
- Secure SSH access to AWS EC2 instances

---

## Challenges I Faced

While working on this project, I came across a few issues that helped me understand Terraform better.

- Accidentally created the S3 bucket with the wrong name and recreated it before configuring the backend.
- Configured the DynamoDB table with an incorrect partition key and learned why Terraform expects `LockID`.
- Lost SSH connectivity after recreating the EC2 instance because the public IP changed.
- Understood why Terraform wanted to replace the EC2 instance when the Ubuntu AMI changed.

Fixing these issues gave me a much better understanding of how Terraform behaves and why reviewing the execution plan before applying changes is important.

---

## Why I'm Documenting This Project

I'm maintaining this repository not only to track my own progress but also to help anyone who is learning Terraform understand how to apply the concepts in a practical project.

Rather than focusing only on the final result, I'm documenting each milestone so that someone can follow the same approach and understand why each component is being added.

---

## Current Milestone

✅ AWS infrastructure provisioned

✅ Remote Terraform backend configured

✅ State locking implemented using DynamoDB

**Next milestone:** Prepare the EC2 instance as a Docker host and start deploying applications using Docker.

