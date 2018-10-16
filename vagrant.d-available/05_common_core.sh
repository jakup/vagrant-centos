# common system packages
yum -y install htop strace lsof policycoreutils-python git bind-utils nmap-ncat tcpdump zip

echo 'export PATH="$PATH:/usr/local/bin"' > /etc/profile.d/usr_local_bin.sh
