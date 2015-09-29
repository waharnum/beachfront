# What is this?

A very basic proof-of-concept for managing multiple static sites as discrete Docker containers, composited with an Ansible playbook for ease of use.

## Prerequisites for local demonstration:

- `handbook.floeproject.local` and `fluidproject.local` are both defined in /etc/hosts to resolve to the Docker host:
  - > 192.168.99.100 handbook.floeproject.local  
  - > 192.168.99.100 fluidproject.local

- you have previously-built containers for static sites available via docker hub or other means, that serve on port 80
    - https://hub.docker.com/r/aharnum/ildh-docker/
    - https://hub.docker.com/r/aharnum/fluidproject-docker/

## Running locally

- ansible-playbook beachfront.yml -i hosts --connection=local
- cd products
- docker-compose up
- sites visible on
  - http://handbook.floeproject.local/
  - http://fluidproject.local/

## How it works

1. inventory of static site containers in beachfront.yml/vars
2. inventory used to generate
    - docker-compose.yml file (starts containers, exposes back-end static containers to nginx reverse proxy)
    - individual nginx configuration files for each back-end static site
    - Dockerfile that loads all needed configuration files when built
