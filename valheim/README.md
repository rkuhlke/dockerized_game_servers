# Dockerized Valheim Server

# How To Use

First build docker container:

```bash
make build
```
or
```bash
docker build -t ${image}:${tag} .
```

Run the container to host your Valheim Server by running the container:

```bash
docker run -it -p 2456-2457:2456-2457/udp -e Name=${NAME} -e PASSWORD=${PASSWORD} -e WORLD=${WORLD} ${image}:${tag}
```
or
```bash
make run
```

This will host a brand new valheim world and server. Note make sure username and password DO NOT match.

To host an existing world attach the your world file path to the container using volume attachement. Note the default path on a windows device is: `C:\Users\<Username>\AppData\LocalLow\IronGate\Valheim\worlds`.

```bash
docker run -it -p 2456-2457:2456-2457/udp -v <path_to_valheim_world_files>:/home/valheim/worlds -e WORLD=${WORLD} -e NAME=${NAME} -e PASSWORD=${PASSWORD} ${repo}:${version}
```



