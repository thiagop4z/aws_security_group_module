locals {

  # Security groups definitions #
  security_groups = {

    ## First security group ##
    "private" = {
      name        = "private"
      description = "private security group"
      vpc_id      = aws_default_vpc.default.id
    }

    ## Second security group ##
    "public" = {
      name        = "public"
      description = "public security group"
      vpc_id      = aws_default_vpc.default.id
    }

  }

}