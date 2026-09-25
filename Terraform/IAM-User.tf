resource "aws_iam_user" "DevOps-User" {
  name = "DevOps-User"
}
resource "aws_iam_access_key" "DevOps-User" {
  user = aws_iam_user.DevOps-User.name
}
resource "aws_iam_user_policy" "DevOps-User-Inline-Policy" {
  name = "test"
  user = aws_iam_user.DevOps-User.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Statement1",
        "Effect" : "Allow",
        "Action" : "eks:*",
        "Resource" : "*"
      }
    ]
  })
}


##############################################################################
# RBAC for the DevOps-User Because it was the root user who created the EKS Infra so the DevOps User cannot access the cluster so we need the authorization for the devops user to access the entire cluster.
###############################################################################
resource "aws_eks_access_entry" "devops_user" {
  cluster_name  = module.eks.cluster_name
  principal_arn = aws_iam_user.DevOps-User.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "devops_user_admin" {
  cluster_name  = module.eks.cluster_name
  principal_arn = aws_eks_access_entry.devops_user.principal_arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}