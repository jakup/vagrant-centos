curl https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz | tar -C /usr/local -xzf -
(cat <<'EOF'
PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
export PATH
EOF
) > /etc/profile.d/golang.sh
