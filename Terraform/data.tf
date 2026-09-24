data "http" "my_ip" {
  url = "https://checkip.amazonaws.com" #This data block will return my local Laptop IP address. So, whenever I want to 
  # Store the IP address of the local machine in the ingress (Inbound rule I can store it).
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["Jenkins-Ubunut-Image"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
