# terraform-sbm

1- **vpc.tf**

## Terraform Networking and Security Script

This Terraform script provisions networking resources and security groups in AWS to set up a Virtual Private Cloud (VPC) environment. Here's a breakdown of the key components:

- **VPC (`aws_vpc`):** Defines a VPC with specified configurations.
- **DMZ Subnet (`aws_subnet` - `dmz_subnet`):** Creates a subnet for publicly accessible resources.
- **Data Subnet (`aws_subnet` - `data_subnet`):** Creates a subnet for private resources.
- **Compute Subnet (`aws_subnet` - `compute_subnet`):** Creates a subnet for various purposes.
- **Internet Gateway (`aws_internet_gateway`):** Establishes an Internet Gateway for internet access.
- **Route Table (`aws_route_table`):** Defines routing rules, including a default route to the Internet Gateway.
- **Route Table Association (`aws_route_table_association`):** Associates the DMZ subnet with the route table.
- **Security Group (`aws_security_group` - `web_sg`):** Sets up security group rules for controlling inbound traffic, including SSH and HTTP access.

### Usage

1. Ensure you have Terraform installed.
2. Customize the variables in the script as needed (`var.cidr_vpc`, `var.dmzsubnet`, `var.datasubnet`, `var.computesubnet`).
-------------------------------------------------------------------------------------------------------------------------------------
2 - **autoscaling.tf**

## Terraform Auto Scaling and Load Balancing Script


This Terraform script sets up an Auto Scaling group with an Application Load Balancer (ALB) in AWS to ensure high availability and scalability for your application. Here's a breakdown of the key components:

- **Launch Configuration (`aws_launch_configuration`):** Defines instance launch configurations, including the AMI, instance type, security groups, and user data script.

- **Auto Scaling Group (`aws_autoscaling_group`):** Creates an Auto Scaling group, specifying the launch configuration and scaling policies. It determines the number of instances and their placement in subnets.

- **Load Balancer (`aws_lb`):** Configures an Application Load Balancer (ALB) that distributes incoming traffic across instances in different subnets. It ensures efficient load balancing and fault tolerance.

- **Load Balancer Listener (`aws_lb_listener`):** Sets up an ALB listener on port 80 to handle incoming HTTP traffic. It returns a "Hello world" HTML response for default requests.

- **Load Balancer Target Group (`aws_lb_target_group`):** Defines a target group for routing traffic to instances. It enables sticky sessions and specifies the duration of cookie-based session persistence.

- **Load Balancer Listener Rule (`aws_lb_listener_rule`):** Establishes a listener rule for forwarding traffic to the target group. This rule currently acts as a default rule.

### Usage

1. Ensure you have Terraform installed.
2. Customize the variables in the script (e.g., `var.ami_id`, `var.instance_type`) and adjust security group rules as needed in `aws_security_group`.
--------------------------------------------------------------------------------------------------------------------------------------------------------
3. **s3-iam.tf**

## Terraform S3 Bucket and IAM User Script


This Terraform script automates the setup of an Amazon S3 bucket and an IAM user with read-only access to that bucket. Here's a breakdown of the key components:

- **S3 Bucket (`aws_s3_bucket`):** Defines an S3 bucket named "test-bucket-lakshmi" with private access control.

- **IAM User (`aws_iam_user`):** Creates an IAM user named "s3-read-only" for accessing AWS resources.

- **IAM Policy Document (`data "aws_iam_policy_document"`):** Specifies an IAM policy document that grants read-only access to the S3 bucket. It allows "s3:GetObject" and "s3:ListBucket" actions.

- **IAM Policy (`aws_iam_policy`):** Creates an IAM policy named "s3-read-only-policy" using the defined policy document.

- **IAM User Policy Attachment (`aws_iam_user_policy_attachment`):** Attaches the IAM policy to the IAM user, granting read-only access to the specified S3 bucket.

### Usage

1. Ensure you have Terraform installed.
2. Customize the script as needed (e.g., update the S3 bucket name, IAM user name, and policy permissions).

--------------------------------------------------------------------------------------------------------------------------------------------------
4 . **var.tf**
## Terraform Input Variables

### Overview

This Terraform script provides a set of customizable input variables to tailor the AWS infrastructure provisioning according to your requirements. Here's a brief explanation of each variable:

- **Provider and Region (`variable "aws_region"`):** Specify the AWS region for resource deployment. Default is "ap-south-1."

- **VPC CIDR Block (`variable "cidr_vpc"`):** Define the CIDR block for your VPC. Default is "172.33.0.0/16."

- **DMZ Subnet CIDR Block (`variable "dmzsubnet"`):** Set the CIDR block for the DMZ subnet. Default is "172.33.1.0/24."

- **Data Subnet CIDR Block (`variable "datasubnet"`):** Define the CIDR block for the data subnet. Default is "172.33.2.0/24."

- **Compute Subnet CIDR Block (`variable "computesubnet"`):** Specify the CIDR block for the compute subnet. Default is "172.33.3.0/24."

- **Availability Zone for DMZ Subnet (`variable "az_dmzsubnet"`):** Set the AZ for the DMZ subnet. Default is "ap-south-1a."

- **Availability Zone for Data Subnet (`variable "az_datasubnet"`):** Define the AZ for the data subnet. Default is "ap-south-1a."

- **Availability Zone for Compute Subnet (`variable "az_computesubnet"`):** Specify the AZ for the compute subnet. Default is "ap-south-1b."

- **AMI ID (`variable "ami_id"`):** Specify the AMI ID for EC2 instances. Default is "ami-0700df939e7249d03."

- **EC2 Instance Type (`variable "instance_type"`):** Define the EC2 instance type. Default is "t2.micro."

### Usage

1. Ensure you have Terraform installed.
2. Customize these variables in the script to match your infrastructure requirements.
----------------------------------------------------------------------------------------------------------------------------------------------

5. **appache-install.sh**

Bash Script for Apache HTTP Server Setup
---------------------------------------------------------------------------------------------------------------------------------------------
**Run terraform init , terraform validate and terraform apply to create or update your resources.**








