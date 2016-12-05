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
        CONFLUENCE_HOSTNAME: 'localhost'
        TIMEZONE: 'Asia/Tokyo'
    environment:
      CONFLUENCE_CATALINA_MEM: 2048
    extra_hosts:
      - 'localhost:127.0.0.1'
```

Note: Confluence needs to add own hostname in /etc/hosts for PDF Export.

2. Up Docker Compose

```zsh
$ docker-compose up
```

3. Initial Settings

Go to http://localhost:8090/confluence , and start initial settings.
Note: The defalut proxy_connect_timeout is 60s. Therefore you need to access without nginx when initial settings.

If you use PostgreSQL with Docker, use docker_compose_with_postgres.yml and following example.

| Database URL | jdbc:postgresql://postgres:5432/postgres |
| User Name    | postgres                                 |
| Password     | postgres                                 |

These name and password. You can change in docker-compose_with_postgres.yml

## FAQ

### Clear data

```zsh
$ rm ./data/confluence-home/*
```
