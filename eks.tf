resource "aws_eks_cluster" "pathnex" {
  name     = var.cluster_name
  role_arn = var.IAMARN
  version  = var.EKSVersion

  upgrade_policy {
    support_type = var.support_type
  }

  vpc_config {
    subnet_ids = concat(data.aws_subnets.public.ids)
    security_group_ids = concat(data.aws_security_groups.default.ids)
    endpoint_public_access  = true
    endpoint_private_access = true
    public_access_cidrs = [var.All-IPV4]
  }
  zonal_shift_config {
         enabled = false
        }
}
