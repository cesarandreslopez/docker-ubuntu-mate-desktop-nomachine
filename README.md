# docker-ubuntu-mate-desktop-nomachine
Ubuntu Desktop 16.04 (MATE) Dockerfile with NoMachine remote access and firefox, libreoffice and tor-browser

# How to run
## Build

```
git clone https://github.com/cesarandreslopez/docker-ubuntu-mate-desktop-nomachine.git
cd docker-ubuntu-mate-desktop-nomachine
docker build -t=cesarandreslopez/docker-ubuntu-mate-desktop-nomachine .
```
## Docker pull command
```
docker pull cesarandreslopez/docker-ubuntu-mate-desktop-nomachine
```

## Enviroment vaiables
USER -> user for the nomachine login
PASSWORD -> password for the nomachine login

## Usage

```
docker run -d -p 4000:4000 --name desktop -e PASSWORD=password -e USER=user --cap-add=SYS_PTRACE cesarandreslopez/docker-ubuntu-mate-desktop-nomachine
```

## Connect to the container

Download the NoMachine client from: https://www.nomachine.com/download, install the client, create a new connection to your public ip, port 4000, NX protocol, use enviroment user and password for authentication (make sure to setup enviroment variables for that)
