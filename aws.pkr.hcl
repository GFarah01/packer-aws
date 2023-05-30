packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "centos" {
  project_id                      = "comworkio"
  account_file                    = "/home/comwork/Downloads/comworkio-894900055ef9.json"
  image_name                      = "centos-gcp-image"
  source_image                    = "centos-stream-8-v20230509"
  zone                            = "europe-west9-a"
  disk_size                       = "20"
  machine_type                    = "e2-micro"
  ssh_username                    = "centos"
  region                          = "europe-west9"
  instance_name                   = "packer-centos-4"
  ssh_pty                         = true
}

build {
  sources = ["source.googlecompute.centos"]

  provisioner "shell" {
    script = "./install.sh"
  }
  name = "gcp-centos-image"
}
