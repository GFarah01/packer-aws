packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "debian" {
  ami_name      = "debian-aws-inovshop"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami    = "ami-0ec7f9846da6b0f61" 
  ssh_username  = "ubuntu"
}

 build {
  sources = [
    "source.amazon-ebs.debian"
    ] 
   provisioner "shell" {
    script = "./install.sh"
  }
  name = "debian-aws-inovshop"
}
