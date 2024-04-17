# GitHub Actions Workflows

This repository contains GitHub Actions workflows for automating Terraform operations and testing a Python application.

## Terraform Workflow

The Terraform workflow automates infrastructure management using Terraform on AWS. It runs whenever a pull request is opened or updated in the `main` branch.

### Workflow Description

This workflow consists of several steps:

1. **Checkout code**: This step checks out the code from the repository.

2. **Set up Terraform**: This step sets up Terraform with the specified version (1.8.0 in this case) using HashiCorp's setup action.

3. **Configure AWS credentials**: This step configures AWS credentials required for Terraform to authenticate with AWS services. It uses GitHub Secrets to securely store AWS access key ID and secret access key.

4. **Terraform Init**: This step initializes Terraform within the specified directory (`./Terraform`).

5. **Terraform Plan**: This step generates an execution plan for Terraform, which outlines the actions it will take to achieve the desired state of the infrastructure. The plan is saved to `tfplan` file for later use.

### Prerequisites

Before running this workflow, make sure you have:

- An AWS account with appropriate permissions.
- Terraform configuration files in the `Terraform` directory of your repository.
- AWS access key ID and secret access key stored as GitHub Secrets.

### Usage

To use this workflow in your GitHub repository:

1. Copy the contents of `.github/workflows/terraform_workflow.yml` into your repository's `.github/workflows` directory.

2. Make sure your Terraform configuration files are located in the `Terraform` directory of your repository.

3. Set up GitHub Secrets for your AWS access key ID and secret access key:
   - `AWS_ACCESS_KEY_ID`: AWS access key ID.
   - `AWS_SECRET_ACCESS_KEY`: AWS secret access key.

4. Customize the Terraform version in the workflow file if needed.

5. Commit the changes to your repository.

6. Create or update a pull request in the `main` branch to trigger the workflow.

7. Monitor the workflow execution and review the Terraform plan to ensure it meets your expectations.

## Python Application Workflow

The Python Application workflow tests a Python application whenever a pull request is opened or updated in the `main` branch.

### Workflow Description

This workflow has the following steps:

1. **Checkout code**: This step checks out the code from the repository.

2. **Set up Python 3.9**: This step sets up Python 3.9 environment using GitHub Actions' setup-python action.

3. **Install dependencies**: This step installs dependencies required by the Python application. It upgrades pip and installs dependencies listed in `requirements.txt` located in the `./Docker/app` directory.

4. **Test with pytest**: This step runs pytest to execute the test suite for the Python application.

### Prerequisites

Before running this workflow, make sure you have:

- A Python application with its dependencies listed in a `requirements.txt` file.
- Test cases written using pytest.
- Docker configuration files (if any) located in the `./Docker/app` directory of your repository.

### Usage

To use this workflow in your GitHub repository:

1. Copy the contents of `.github/workflows/python_application.yml` into your repository's `.github/workflows` directory.

2. Ensure that your Python application code is properly structured and includes test cases written with pytest.

3. Create or update a pull request in the `main` branch to trigger the workflow.

4. Monitor the workflow execution and review the test results to ensure the integrity of your Python application.

### Notes

- Make sure to update the Python version in the Python application workflow file if your application requires a different Python version.
- Ensure that the `requirements.txt` file is located in the `./Docker/app` directory of your repository, or update the path accordingly in the workflow file.
- Customize the workflows as needed to include additional steps such as building Docker images or deploying the application.

