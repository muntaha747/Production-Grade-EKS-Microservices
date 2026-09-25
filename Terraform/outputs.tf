output "cluster_name" {
  value = module.eks.cluster_name
}

output "bastion_public_ip" {
  value = module.bastion_host.public_ip
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "devops_user_access_key_id" {
  value = aws_iam_access_key.DevOps-User.id
}

output "devops_user_secret_access_key" {
  value     = aws_iam_access_key.DevOps-User.secret
  sensitive = true
}