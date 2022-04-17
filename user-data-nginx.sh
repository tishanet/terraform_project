#!/bin/bash
sudo yum update
sudo amazon-linux-extras install -y nginx1
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx