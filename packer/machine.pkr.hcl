packer {
    required_plugins {
        amazon = {
            version = ">= 1.2.6"
            source  = "github.com/hashicorp/amazon"
        }
    }
}

source "amazon-ebs" "ubuntu" {
    access_key = "AKIAWMFFVRB3LMPCKGX3"
    secret_key = "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"
    ami_name      = "aws-ubuntu-image"
    instance_type = "t2.micro"
    region        = "us-east-1"
    source_ami = "ami-06aa3f7caf3a30282"
    ssh_username = "ubuntu"
}

build {
  name    = "new-packer"
  sources = ["source.amazon-ebs.ubuntu"] 
  provisioner "shell" {
    inline = [
            "sudo apt update -y",
            "sudo apt install default-jdk -y",
            "curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -",
            "sudo apt-get install -y nodejs",
            "sudo apt-get update -y && sudo apt-get install yarn -y",
            "sudo apt install tomcat9 -y",
            "sudo systemctl start tomcat9",
            "sudo systemctl enable tomcat9",
            "sudo systemctl status tomcat9",
            "sudo apt install tomcat9-docs -y",
            "sudo apt install tomcat9-examples -y",
            "sudo apt install tomcat9-admin -y",
            "sudo systemctl status tomcat9",
            "sudo systemctl restart tomcat9"

    ]
  }

}