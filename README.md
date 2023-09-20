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





