#!/bin/bash
sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker.service
sudo docker run -d --name jmeter-master -p 60000:60000 vinsdocker/jmmaster /bin/bash
