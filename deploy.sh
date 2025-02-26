#!/bin/bash
docker pull frankgin/devops-react-app:latest
docker run -d -p 80:80 frankgin/devops-react-app:latest
