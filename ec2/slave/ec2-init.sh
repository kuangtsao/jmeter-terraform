#!/bin/bash
export LOCALIP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker.service
sudo docker run -d -e LOCALIP=$instance_ip --name jmeter-slave -p 1099:1099 -p 50000:50000 vinsdocker/jmawsserver /bin/bash
