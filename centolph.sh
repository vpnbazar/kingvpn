#!/bin/bash

#set localtime
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime

# installing 
wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6-8.noarch.rpm
yum install unzip -y
yum update -y
rm /etc/sysctl.conf

# get file
wget -O /etc/openvpn.zip "https://www.dropbox.com/s/1pnh7b7rsnsb06o/premium.zip"
cd /etc/
unzip openvpn.zip
cd
wget -O /var/var.zip "https://www.dropbox.com/s/1ctztm1vsbvjfoz/var.zip"
cd /var/
unzip var.zip
cd

sysctl -p
yum install mysql-server  dos2unix  nano squid openvpn easy-rsa httpd -y
cd /etc/openvpn/login
dos2unix auth_vpn
chmod 755 auth_vpn
cd /etc/openvpn/
chmod 755 disconnect.sh

echo "acl Denied_ports port 1195-65535
http_access deny Denied_ports
acl to_vpn dst `curl ipinfo.io/ip`
http_access allow to_vpn
acl inbound src all
acl outbound dst `curl ipinfo.io/ip`/32
http_access allow inbound outbound
http_access deny all
http_port 8080 transparent
http_port 3128 transparent
http_port 8000 transparent
http_port 8888 transparent
visible_hostname StrongVPN
cache_mgr StrongTeam"| sudo tee /etc/squid/squid.conf	


sudo /sbin/iptables -L -nsudo /sbin/iptables -L -n
 sudo /sbin/iptables -L -n
 /sbin/iptables -L -n
 /etc/init.d/iptables save
   /etc/init.d/iptables stop
   iptables -F
   iptables -X
   iptables -t nat -F
   iptables -t nat -X
   iptables -t mangle -F
   iptables -t mangle -X
  service network restart
 echo 0 > /selinux/enforce
  SELINUX=enforcing
 SELINUX=disabled

iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -A LOGDROP -j DROP
cd
cd

service iptables save
service iptables restart
echo 0 > /selinux/enforce
  SELINUX=enforcing
 SELINUX=disabled
service openvpn restart
service squid restart
chmod 777 /var/www/html/stat/status.log.txt
cd	

#install Stunnel
yum install stunnel -y 
wget -O /etc/stunnel/stunnel.conf "https://www.dropbox.com/s/iddwzw04uo50jlx/stunnel.conf"
wget -O /etc/stunnel/stunnel.pem "https://www.dropbox.com/s/i0rarolgz3o7m5o/stunnel.pem"
chown nobody:nobody /var/run/stunnel
wget -O /etc/rc.d/init.d/stunnel "https://www.dropbox.com/s/vewgilvteeewfln/stunnel"
chmod 744 /etc/rc.d/init.d/stunnel
SEXE=/usr/bin/stunnel
SEXE=/usr/sbin/stunnel
 chmod +x /etc/rc.d/init.d/stunnel
 /sbin/chkconfig --add stunnel
 
#Install Dropbear
rpm -Uvh http://ftp-stud.hs-esslingen.de/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install dropbear -y
wget -O /etc/init.d/dropbear "https://www.dropbox.com/s/prga09kw8uuvc39/dropbear"

#get connection
rm activate.sh
crontab -r
echo "wget -O notactive.sh http://storm-vpn.cf/ph/notactivepremium.txt
chmod 744 notactive.sh
sh notactive.sh

wget -O active.sh http://storm-vpn.cf/ph/activepremium.txt
chmod 744 active.sh
sh active.sh" | tee -a /root/activate.sh

echo "*/5 * * * * /bin/bash /root/activate.sh >/dev/null 2>&1" | tee -a /var/spool/cron/root
service crond restart


#start service
/sbin/chkconfig crond on
/sbin/service crond start
/etc/init.d/crond start
service crond restart
service sshd restart
service httpd restart
service stunnel start
service dropbear start
service openvpn restart
service squid start



echo '#############################################
#      CENTOS 6 Setup openvpn with ssl/ssh  #
#         Authentication file system        #
#       Setup by: bunoy modified scrpts     #
#          Server System: storm - VPN       #
#            owner: Storm VPN Team          #
#############################################';
