//provider
variable "aws_region" {
  type        = string
  description = "region"
  default     = "ap-south-1"
}
// vpc
variable "cidr_vpc" {
  type        = string
  description = "cidr"
  default     = "172.33.0.0/16"
}
// dmz
variable "dmzsubnet" {
  type        = string
  description = "dmzsubnet"
  default     = "172.33.1.0/24"
}
// data
variable "datasubnet" {
  type        = string
  description = "datasubnet"
  default     = "172.33.2.0/24"
}
// compute
variable "computesubnet" {
  type        = string
  description = "datasubnet"
  default     = "172.33.3.0/24"
}
// az_dmzsubnet
variable "az_dmzsubnet" {
  type        = string
  description = "zone"
  default     = "ap-south-1a"
}
//az_datasubnet
variable "az_datasubnet" {
  type        = string
  description = "zone"
  default     = "ap-south-1a"
}
//az_compute
variable "az_computesubnet" {
  type        = string
  description = "zone"
  default     = "ap-south-1b"
}
variable "ami_id" {
  type        = string
  description = "ami"
  default     = "ami-0700df939e7249d03"
}

//ec2 instance type
variable "instance_type" {
  type        = string
  description = "ami"
  default     = "t2.micro"
}
