#!/bin/bash
sudo docker stop $(sudo docker ps -a -q)
## удаляет не используемые контейнеры
sudo docker container prune --force