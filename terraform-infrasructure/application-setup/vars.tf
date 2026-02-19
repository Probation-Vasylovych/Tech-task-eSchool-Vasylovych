variable "region" {
    description="Region where resource will be created"
    type= string
}

variable "instance_type" {
    description="Type of insttances that will be created"
    type= string
}

variable "cidr_block" {
    description="CIDR for public subnet"
    type= string
}

variable "my_ip" {
  description = "My public IP"
  type        = string
}

