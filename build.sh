#!/bin/bash
docker build -t frankgin/devops-react-app:latest .
docker tag frankgin/devops-react-app:latest frankgin/devops-react-app:latest
docker push frankgin/devops-react-app:latest
