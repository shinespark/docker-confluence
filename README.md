# docker-confluence

This repository is dockerize Confluence.
Forked by https://bitbucket.org/atlassian/docker-atlassian-confluence-server

Composing of

* nginx
* Confluence

## Change from Official

* use nginx
* use IPAGothic
* Confluence 5.10.8

## How to use

1. Change docker-compose.yml

```diff
    args:
        CONFLUENCE_HOSTNAME: 'confluence.local'
        TIMEZONE: 'Asia/Tokyo'
    environment:
      CONFLUENCE_CATALINA_MEM: 2048
    extra_hosts:
      - 'confluence.local:127.0.0.1'
```

Note: Confluence needs to add own hostname in /etc/hosts for PDF Export.

2. Up Docker Compose

```zsh
$ docker-compose up
```



## FAQ

Reset Data

```zsh
$ rm ./data/confluence-home/*
```
