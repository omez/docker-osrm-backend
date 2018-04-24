
MAPNAME=belarus-latest

all: download build


download:
	wget --progress=dot -O $(MAPNAME).osm.pbf http://download.geofabrik.de/europe/$(MAPNAME).osm.pbf

build:
	docker build --pull --build-arg map=$(MAPNAME) .
