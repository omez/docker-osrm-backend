FROM    osrm/osrm-backend
MAINTAINER  Alexander Sergeychik <alexander@isolutions.by>

ARG     mapRef=europe/belarus-latest
ARG     mapType=osm.pbf

RUN     mkdir /maps
RUN     echo "Downloading map: http://download.geofabrik.de/$mapRef.$mapType" && wget -q -O /maps/map.$mapType "http://download.geofabrik.de/$mapRef.$mapType"

RUN     osrm-extract -p /opt/car.lua "/maps/map.$mapType"
RUN     osrm-contract /maps/map.osrm

CMD     osrm-routed /maps/map.osrm

EXPOSE 5000
