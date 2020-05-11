#!/usr/bin/env bash
git clone https://github.com/metrumresearchgroup/gridengine_prometheus.git
cd gridengine_prometheus
docker build . -t sge_exporter_tmp
docker create -it --name sge_exporter_tmp sge_exporter_tmp /bin/sh
docker cp sge_exporter_tmp:/app/gridengine_exporter ../
docker rm -fv sge_exporter_tmp
docker rmi -f sge_exporter_tmp
cd ../
rm -rf gridengine_prometheus
docker rmi -f golang:alpine
docker build . -t sge_exporter:20200510
