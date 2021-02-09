#需要修改本文件中的公网ip地址再运行脚本
sudo apt-get update

sudo apt-get install pptpd -y

sudo cp pptpd.conf /etc/pptpd.conf

sudo cp chap-secrets /etc/ppp/chap-secrets

#设置最大传输单元MTU【ubuntu不会】

sudo cp pptpd-options /etc/ppp/pptpd-options

sudo cp /etc/sysctl.conf /etc/sysctl.conf

sudo sysctl -p

#开启gre协议并打开服务器47,1723号端口

sudo iptables -A INPUT -p gre -j ACCEPT

sudo iptables -A INPUT -p tcp --dport 1723 -j ACCEPT

sudo iptables -A INPUT -p tcp --dport 47 -j ACCEPT

#开启NAT转发（请先看红色注意部分）
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.255.0 -j SNAT --to-source 47.243.21.196
#iptables永久生效

sudo iptables-save

#重启服务生效

service pptpd restart
#添加开机自启[还没做]

#网页手动添加安全组，优先级100，协议类型自定义tcp，端口范围1723回车，授权对象0.0.0.0/0

#win10香港，不容易连上，需要多次


