packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "alma-linux" {
  ami_name      = "inovshop-cwc-ami3"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami    = "ami-070a2196d1f4197b6" 
  #ami = "aws-marketplace/AlmaLinux OS 8.6.20220901 x86_64-c076b20a-2305-4771-823f-944909847a05"  
  ssh_username  = "ec2-user"
}

 build {
  sources = [
    "source.amazon-ebs.alma-linux"
    ] 
   provisioner "shell" {
    script = "./install.sh"
  }
  name = "inovshopcwcami2"
}
