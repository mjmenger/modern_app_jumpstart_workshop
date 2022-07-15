# install necessary tools
sudo apt update
sudo apt install -y make wget curl

# install kubectl
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# install Hey
wget https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64
sudo mv hey_linux_amd64 /usr/local/bin/hey
sudo chmod +x /usr/local/bin/hey