# Rule module definition

resource "aws_security_group_rule" "rule" {

  type              = var.type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = var.security_group_id
}

####### variables #######

variable "type" {
  type = string
}

variable "from_port" {
  type = number
}

variable "to_port" {
  type = number
}

variable "protocol" {
  type = string
}

variable "cidr_blocks" {
  type = list
}

variable "security_group_id" {
  type = string
}