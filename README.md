# Latest-LAMP-Docker

Dockerfile for latest lamp based on ubuntu

## Usage

```
git clone https://github.com/whirlwind110/latest-lamp-docker.git

cd latest-lamp-docker

docker build -t lamp:latest .

docker run -d -p 80:80 lamp:latest
```

## Others

install some useful php extensions

set php open_basedir as /var/www

close php mysql apache log

enable apache rewrite

disable apache directory index


