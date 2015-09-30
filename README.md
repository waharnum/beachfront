# What is this?

A very basic proof-of-concept for managing multiple static sites as discrete Docker containers, composited with an Ansible playbook for ease of use.

## Prerequisites for local demonstration:

- Running Docker setup, including docker-compose (FE, Docker Machine on OS X)
- `handbook.floeproject.local` and `fluidproject.local` are both defined in /etc/hosts to resolve to the Docker host, FE:
  - {docker-host-ip} handbook.floeproject.local  
  - {docker-host-ip} fluidproject.local
- you have previously-built containers for static sites available via docker hub or other means, that serve on port 80
    - https://hub.docker.com/r/aharnum/ildh-docker/
    - https://hub.docker.com/r/aharnum/fluidproject-docker/

## Running locally

- `ansible-playbook beachfront.yml -i hosts --connection=local`
- `cd products`
- `docker-compose up`
- sites will be visible on
  - http://handbook.floeproject.local/
  - http://fluidproject.local/

## How it works

1. maintain list of static site containers configurations in beachfront.yml/vars
2. list is used by Ansible to generate    
    - individual nginx configuration files for each back-end static site, to configure reverse proxy behaviour
    - a Dockerfile based on the nginx image that loads all the needed static site configuration files when built
    - docker-compose.yml configuration file
        - `docker-compose up` can then start all the necessary containers and exposes the 'back end' containers serving static sites to nginx functioning as a reverse proxy
