A very basic proof-of-concept for managing multiple static sites as Docker containers

Assuming `handbook.floeproject.local` and `fluidproject.local` are both defined in /etc/hosts to resolve to the Docker host:

> 192.168.99.100 handbook.floeproject.local  
> 192.168.99.100 fluidproject.local

1. `docker run --name ildh -d aharnum/ildh-docker`
2. `docker run --name fluidproject -d aharnum/fluidproject-docker`
3. `docker run --name docker-forwarder --link ildh:ildh --link fluidproject:fluidproject -d -p 80:80 aharnum/docker-forwarder`
