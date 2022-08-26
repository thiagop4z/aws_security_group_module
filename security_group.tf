# Calling the modules

module "security_group" {

  source = "./modules/security_group"

  for_each = local.security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = each.value.vpc_id
}

module "rule" {

  source = "./modules/rule"

  for_each = local.rules

  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = each.value.security_group_id

}