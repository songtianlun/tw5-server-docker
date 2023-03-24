# TW5 Server In Docker

A minimal web server in Ruby that allows editing and saving of TiddlyWiki in a browser. 

Based on https://gist.github.com/jimfoltz/ee791c1bdd30ce137bc23cce826096da by Jim Foltz.
Based on https://github.com/korikori/tw5_server by  korikori.

## Values

- You can use your own single file wiki with this server.
- backup with local and gitea...

## Run

> Copy your wiki (`index.html`) to `/data/docker/wiki/` and run the following command.

```bash
$ docker run -it -d -p 8000:8000 -v ~/Home/develop/wiki:/tiddlywiki songtianlun/tw5-server:<tag>
# example
$ docker run -it -d -p 8123:8000 \
    --name wiki \
    --restart unless-stopped \
    -v /data/docker/wiki/:/tiddlywiki \
    songtianlun/tw5-server:main-2023-03-24-13-35-43
```

## docker-compose

```yaml
version: '3'
services:
  wiki:
	image: songtianlun/tw5-server:main-2023-03-24-13-35-43
	container_name: wiki
	restart: unless-stopped
	ports:
	  - 8123:8000
	volumes:
	  - /data/docker/wiki/:/tiddlywiki

networks:
  default:
    external: true
    name: myDefault
```
