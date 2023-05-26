packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "debian" {
  ami_name                    = "debian-cwc-paris-b"
  associate_public_ip_address = true
  vpc_id                      = "vpc-0f2534cdfaf552861"
  subnet_id                   = "subnet-0702488d714202bfa"
  security_group_id           = "sg-0165623a9be1cdf5a"
  instance_type               = "t2.micro"
  region                      = "eu-west-3"
  source_ami                  = "ami-008bcc0a51a849165"
  ssh_username                = "ubuntu"

}

build {
  sources = [
    "source.amazon-ebs.debian"
  ]
  provisioner "shell" {
    script = "./install.sh"
  }
  name = "debian-cwc-paris"
}
