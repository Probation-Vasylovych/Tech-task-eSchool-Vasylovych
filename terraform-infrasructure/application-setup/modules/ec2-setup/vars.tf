variable "name" {
  description = "Name of instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet where instance will be created"
  type        = string
}

variable "vpc_id" {
  description = "VPC where security group will be created"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "ingress_rules" {
  description = "Security group ingress rules"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_ipv4   = optional(string)
    source_sg_id = optional(string)
  }))
}

variable "common_tags" {
  description = "Tags for resources"
  type = map(string)
}