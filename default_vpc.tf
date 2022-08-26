/* The aws_default_vpc resource behaves differently from normal resources in that if a default VPC exists, Terraform does not create this resource, but instead "adopts" it into management. If no default VPC exists, Terraform creates a new default VPC, which leads to the implicit creation of other resources. By default, terraform destroy does not delete the default VPC but does remove the resource from Terraform state. Set the force_destroy argument to true to delete the default VPC. 
Source: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc
*/

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}