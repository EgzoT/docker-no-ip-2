# docker-no-ip-2

Docker image to run the [noip](https://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client/) dynamic update client.

Script based on the tutorial [How to Install the Dynamic Update Client on Linux](https://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client/) and noip-2.1.9-1/Makefile install script.

## Build

```sh
sudo docker build -t noip2:1 --build-arg USERNAME="LOGIN_OR_EMAIL" --build-arg PASSWORD="PASSWORD" --build-arg INTERVAL=15 .
```

## Run

```sh
sudo docker run --name noip2 --restart unless-stopped -d noip2:1
```
