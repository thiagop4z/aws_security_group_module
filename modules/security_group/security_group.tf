# Security group module definition

resource "aws_security_group" "security_group" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

}

####### variables #######

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "vpc_id" {
  type = string
}

####### outputs #######

output "id" {
  value = aws_security_group.security_group.id
}