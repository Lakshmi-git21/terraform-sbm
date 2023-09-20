resource "aws_launch_configuration" "web_lc" {
  name_prefix             = "web-lc-"
  image_id                = var.ami_id
  instance_type           = var.instance_type
  security_groups         = [aws_security_group.web_sg.id]
  user_data = file("apache-install.sh")
}

resource "aws_autoscaling_group" "web_asg" {
  name                 = "web-asg"
  launch_configuration = aws_launch_configuration.web_lc.name
  min_size             = 2
  max_size             = 2
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.compute_subnet.id]  # Reference to the compute_subnet
}

resource "aws_lb" "web_lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.dmz_subnet.id,aws_subnet.compute_subnet.id]  # Reference to the dmz_subnet
  security_groups    = [aws_security_group.web_sg.id]
}

resource "aws_lb_listener" "web_lb_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/html"
      message_body = "<HTML><h1>Hello world</h1></HTML>"
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "web_tg" {
  name        = "web-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.myvpc.id
  stickiness {
    type  = "lb_cookie"  # Enable sticky IP sessions
    cookie_duration = 3600 
    enabled      = true
  }
}

resource "aws_lb_listener_rule" "web_lb_rule" {
  listener_arn = aws_lb_listener.web_lb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
  condition {
    # No conditions specified, it acts as a default rule
  }
}
