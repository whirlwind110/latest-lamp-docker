# dockerlamp

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

hidden apache vhost access and error log

hidden mysql log

hidden php log

enable apache rewrite

remove apache index


