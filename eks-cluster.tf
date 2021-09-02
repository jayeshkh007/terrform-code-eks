module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.17"
  subnets         = module.vpc.public_subnets

  tags = {
    Environment   = var.env_type
    GithubRepo    = "terraform-aws-eks"
    GithubOrg     = "terraform-aws-modules"
  }

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = "worker-group"
      instance_type                 = "t2.small"  # "t2.medium"
      key_name                      = var.aws_key_pair
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      asg_desired_capacity          = 1
      asg_min_size                  = 1
      asg_max_size                  = 1
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
