#需要修改本文件中的公网ip地址再运行脚本
sudo apt-get update

#sudo apt-get upgrade

sudo apt-get install pptpd -y 

chmod +x ./copyfiles.sh

./copyfiles.sh