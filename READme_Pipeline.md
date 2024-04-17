# Docker Build and Push + Terraform Workflow

This GitHub Actions workflow automates the building and pushing of a Docker image to Amazon ECR and the deployment of infrastructure using Terraform. It runs when code is pushed to the `main` branch.

## Workflow Description

This combined workflow has two main jobs:

1. **Build and Push Docker Image to Amazon ECR**: This job builds a Docker image, tags it, logs in to Amazon ECR, and then pushes the image to the specified ECR repository.

2. **Deploy Infrastructure with Terraform**: This job checks out the code, configures AWS credentials, initializes Terraform, generates a Terraform plan with the Docker image tag as a variable, and applies the changes to deploy the infrastructure.

## Docker Build and Push Job

### Steps:

1. **Checkout code**: Checks out the code from the repository.

2. **Configure AWS credentials**: Configures AWS credentials using GitHub Secrets.

3. **Login to Amazon ECR**: Logs in to the Amazon ECR registry.

4. **Build Docker image**: Builds a Docker image using the Dockerfile in the `./Docker` directory.

5. **Tag Docker image**: Tags the Docker image with the latest GitHub run ID.

6. **Push Docker image to Amazon ECR**: Pushes the tagged Docker image to the specified ECR repository.

## Terraform Job

### Steps:

1. **Checkout code**: Checks out the code from the repository.

2. **Configure AWS credentials**: Configures AWS credentials using GitHub Secrets.

3. **Terraform Init**: Initializes Terraform within the `./Terraform` directory.

4. **Terraform Plan**: Generates a Terraform plan with the Docker image tag as a variable.

5. **Terraform Apply**: Applies the Terraform plan to deploy the infrastructure.

## Prerequisites

Before running this workflow, make sure you have:

- AWS credentials with permissions to access Amazon ECR and manage the target infrastructure.
- Docker configuration files (Dockerfile) in the `./Docker` directory.
- Terraform configuration files in the `./Terraform` directory.
- GitHub Secrets configured for AWS access key ID and secret access key.

## Usage

To use this workflow in your GitHub repository:

1. Copy the contents of `.github/workflows/docker_build_and_push_with_terraform.yml` into your repository's `.github/workflows` directory.

2. Customize the workflow as needed, such as adjusting the AWS region and ECR registry URL.

3. Commit the changes to your repository.

4. Push code changes to the `main` branch to trigger the workflow.

5. Monitor the workflow execution and review the logs to ensure successful Docker image building, pushing, and infrastructure deployment.

## Notes

- Ensure that Docker and Terraform are properly installed and configured on the GitHub Actions runner environment.
- Review the Terraform code and plan before applying changes to the infrastructure.
- Use caution when deploying changes to production environments.