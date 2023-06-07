packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "centos" {
  project_id    = "comworkio"
  account_file  = "/home/comwork/Downloads/comworkio-894900055ef9.json"
  image_name    = "centos-gcp-image2"
  source_image  = "centos-stream-8-v20230509"
  zone          = "europe-west9-a"
  disk_size     = "40"
  machine_type  = "e2-small"
  ssh_username  = "centos"
  region        = "europe-west9"
  instance_name = "packer-centos"
  ssh_pty       = true
  metadata = {
    startup-script-url = "./script.yml"
  }
}

build {
  sources = ["source.googlecompute.centos"]

  provisioner "shell" {
    script = "./install.sh"
  }

  provisioner "file" {
    source      = "./script.yml"
    destination = "/tmp/cloud-init-script.yml"
  }
  name = "centos-gcp-image2"
}

