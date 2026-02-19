variable "cidr_block" {
  description = "Cidr block for public subnet"
  type        = string
}

variable "common_tags" {
  description = "Tags for resources"
  type = map(string)
}