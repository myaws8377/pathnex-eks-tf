#Auto Discover VPC and Subnets
data "aws_vpc" "DefaultSelected" {
  tags = {
    Name = var.VPCDefault
  }
}

data "aws_subnets" "public" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.DefaultSelected.id]
  }
  tags = { Tier = "public" }
}

data "aws_security_groups" "default" {
  filter {
    name = "default-sg"
    values = data.aws_security_groups.default.ids
  }
}