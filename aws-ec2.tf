variable "key_pair" {
  default = "ec2_syncer00001"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example-server1" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.example-a.id}"
    vpc_security_group_ids = ["${aws_security_group.example-allow-all.id}"]
    key_name = "${var.key_pair}"
    count = 1
    tags = {
        Name = "examples"
    }
}

resource "aws_instance" "example-server2" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.example-c.id}"
    vpc_security_group_ids = ["${aws_security_group.example-allow-all.id}"]
    key_name = "${var.key_pair}"
    count = 1
    tags = {
        Name = "examples"
    }
}