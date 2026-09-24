terraform {
  backend "s3" {
    bucket       = "tf-eks-statefile-bucket"
    region       = "us-east-1"
    key          = "dev"
    use_lockfile = true
  }
}
