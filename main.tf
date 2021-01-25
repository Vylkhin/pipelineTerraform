terraform{
  backend "s3"{
    bucket = var.bucket
    key = var.ssh_key
    region = var.region
  }
}

provider "aws"{
  region = var.region
}

data "aws_ami" "ubuntu"{
  most_recent = true

  filter{
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter{
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance_terraform_lespagnol"{
  count = var.create_instance ? var.instance_number : 0
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.ssh_key

  tags = {
    Name = "instance_terraform_lespagnol"
  }
}
