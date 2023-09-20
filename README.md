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

