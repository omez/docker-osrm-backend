
MAP_NAME=belarus-latest
DOCKER_IMAGE=docker.isolutions.by/osrm/belarus:latest


all: download build


download:
	wget --progress=dot -O $(MAP_NAME).osm.pbf http://download.geofabrik.de/europe/$(MAP_NAME).osm.pbf

build:
	docker build -t $(DOCKER_IMAGE) --pull --build-arg map=$(MAP_NAME) .
