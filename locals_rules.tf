locals {

  # Rules definitions #
  rules = {

    ####### Private security group rules #######
    "private_http_in" = {
      type              = "ingress"
      from_port         = 80
      to_port           = 80
      protocol          = "tcp"
      cidr_blocks       = ["10.0.0.0/8"]
      security_group_id = module.security_group["private"].id
    }

    "private_https_in" = {
      type              = "ingress"
      from_port         = 443
      to_port           = 443
      protocol          = "tcp"
      cidr_blocks       = ["10.0.0.0/8"]
      security_group_id = module.security_group["private"].id
    }

    "pivate_out" = {
      type              = "egress"
      from_port         = 0
      to_port           = 0
      protocol          = -1
      cidr_blocks       = ["0.0.0.0/0"]
      security_group_id = module.security_group["private"].id
    }

    ####### Public security group rules #######
    "public_http_in" = {
      type              = "ingress"
      from_port         = 80
      to_port           = 80
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
      security_group_id = module.security_group["public"].id
    }

    "public_https_in" = {
      type              = "ingress"
      from_port         = 443
      to_port           = 443
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
      security_group_id = module.security_group["public"].id
    }

    "public_out" = {
      type              = "egress"
      from_port         = 0
      to_port           = 0
      protocol          = -1
      cidr_blocks       = ["0.0.0.0/0"]
      security_group_id = module.security_group["public"].id
    }

  }
}