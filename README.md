# sge_exporter
SGE exporter for prometheus based on the [gridengine_prometheus project](https://github.com/metrumresearchgroup/gridengine_prometheus). Please check the project for grafana dashboard json file and other information.

### Please run this container on SGE master node.

This project does:
  1. compiles the gridengine_prometheus project and grabs the gridengine_exporter binary.
  2. encapsulates the gridengine_exporter into a debian image that allows it to run.
  
## Usage:
### To create the exporter docker image:
After clone, please run docker build.

### To run the exporter docker image:
You may run it using docker run as:
```
docker run -v /var/lib/gridengine:/var/lib/gridengine:ro -v /usr/lib/gridengine:/usr/lib/gridengine:ro -e SGE_CELL=YOUR_SGE_CELL -e PORT=YOUR_PORT sge_exporter:20200511
```

or via docker-compose as:
```docker-compose
version: '2'
services:
  sge-exporter:
    image: sge_exporter:20200511
    environment:
      SGE_CELL: "YOUR_SGE_CELL"
      PORT: "YOUR_PORT"
    volumes:
      - /var/lib/gridengine:/var/lib/gridengine:ro
        #      - /usr/bin:/usr/bin:ro
        #      - /usr/share/gridengine:/usr/share/gridengine:ro
      - /usr/lib/gridengine:/usr/lib/gridengine:ro
    network_mode: "host"
```
