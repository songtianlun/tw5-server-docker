# TW5 Server In Docker

A minimal web server in Ruby that allows editing and saving of TiddlyWiki in a browser. 

Based on https://gist.github.com/jimfoltz/ee791c1bdd30ce137bc23cce826096da by Jim Foltz.
Based on https://github.com/korikori/tw5_server by  korikori.

## Values

- You can use your own single file wiki with this server.
- backup with local and gitea...

## Run

> Copy your wiki (`index.html`) to `~/Home/develop/wiki` and run the following command.

```bash
$ docker run -it -d -p 8000:8000 -v ~/Home/develop/wiki:/tiddlywiki songtianlun/tw5-server-docker:latest
```
