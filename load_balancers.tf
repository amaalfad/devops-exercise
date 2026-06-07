# Public Load Balancer
resource "aws_elb" "public" {
  name            = "public-lb"
  internal        = false
  security_groups = [aws_security_group.public.id]
  subnets         = [aws_subnet.public.id]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  tags = { Name = "public-lb" }
}

# Private Load Balancer (Servers)
resource "aws_elb" "servers" {
  name            = "servers-lb"
  internal        = true
  security_groups = [aws_security_group.servers.id]
  subnets         = [aws_subnet.servers.id]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  tags = { Name = "servers-lb" }
}

# Private Load Balancer (Database)
resource "aws_elb" "database" {
  name     = "database-lb"
  internal = true
  subnets  = [aws_subnet.database.id]

  listener {
    instance_port     = 8080
    instance_protocol = "TCP"
    lb_port           = 8080
    lb_protocol       = "TCP"
  }

  tags = { Name = "database-lb" }
}
