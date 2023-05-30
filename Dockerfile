from debian:buster
maintainer Takahiro Yoshimura <altakey@gmail.com>
run apt-get update -y
run apt-get install -y convmv zip unzip locales
run sed -i -e 's/^# en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen && locale-gen
run mkdir /app /out
copy cp932.sh /app/cp932
copy fixup.sh /app/fixup
run chmod 700 /app/*
env PATH /app:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
env TZ Asia/Tokyo
workdir /out
cmd ["ls", "-1", "/app/"]
