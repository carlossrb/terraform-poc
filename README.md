# Project: Processing JSON Files from S3 with SQS and Lambda

This project sets up an AWS infrastructure using Terraform to process JSON files added to an S3 bucket. When a JSON file is uploaded to the bucket, an event is sent to an SQS queue. A Lambda function, written in TypeScript, consumes the messages from the SQS queue, reads the content of the JSON file from S3, and processes it as needed.

## Configuration and Deployment

### Configure AWS Credentials

Ensure that your AWS credentials are configured. You can use `aws configure` or set environment variables:

```bash
export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_KEY"
export AWS_DEFAULT_REGION="region"
```

### Install Lambda Dependencies and Generate the Zip File

Run the script to compile the TypeScript code and create the `lambda.zip` file:

```bash
./scripts/build_lambda.sh
```

#### Initialize Terraform

```bash
terraform init
```

#### Review the Terraform Plan

```bash
terraform plan
```

#### Apply the Terraform Configurations

```bash
terraform apply
```

Type `yes` when prompted to confirm the creation of the resources.