FROM    osrm/osrm-backend
MAINTAINER  Alexander Sergeychik <alexander@isolutions.by>

ARG     mapRef=europe/belarus-latest
ARG     mapType=osm.pbf

ENV     DOWNLOAD_URL    "http://download.geofabrik.de/${mapRef}.${mapType}"

RUN     mkdir /maps
RUN     echo $DOWNLOAD_URL
ADD     $DOWNLOAD_URL "/maps/map.${mapType}"

RUN     osrm-extract -p /opt/car.lua "/maps/map.$mapType"
RUN     osrm-contract /maps/map.osrm

CMD     osrm-routed /maps/map.osrm

EXPOSE 5000
