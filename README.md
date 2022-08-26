# AWS Security Group module

This terraform project dinamically creates AWS security groups and rules using the meta-argument [for_each](https://www.terraform.io/language/meta-arguments/for_each). That way you can create as many security groups and rules as you need, just by adding the security group or rule information in the *locals* files, without code replication.

## Creating Security Groups

To create a security group you must create a new map block inside \"locals_security_groups.tf"\, passing all the information needed, like in the example bellow:

```HCL
"private" = {
      name        = "private"
      description = "private security group"
      vpc_id      = aws_default_vpc.default.id
    }
```
The name of the map must be unique, as it is used to referentiate the resource created. Example: `module.security_group["private"]`

## Creating rules

Creating rules follows the same pattern described above, you must create a new map block inside "locals_rules.tf", with the rule information:

```HCL
    "private_http_in" = {
      type              = "ingress"
      from_port         = 80
      to_port           = 80
      protocol          = "tcp"
      cidr_blocks       = ["10.0.0.0/8"]
      security_group_id = module.security_group["private"].id
    }
````
The field "security_group_id" connects the rule with the security group.

## Best Practices
It's a good practice in terraform split the content in files dedicated to each function, like variables.tf, outputs.tf, versions.tf, etc. This project don't follows this principle because the main porpouse here is the code reading, so the variables and outputs were kept with the module definition file.

