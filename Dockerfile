FROM    osrm/osrm-backend
MAINTAINER  Alexander Sergeychik <alexander@isolutions.by>

ARG     profile=car
ARG     map=map

RUN     mkdir /maps
COPY    ./$map.osm.pbf /maps/map.osm.pbf

# http://download.geofabrik.de/europe/belarus-latest.osm.pbf
RUN     echo "Extracting map=${map} for profile=${vehicle}"
RUN     osrm-extract -p "/opt/$profile.lua" "/maps/map.osm.pbf"
RUN     osrm-contract /maps/map.osrm
RUN     rm /maps/map.osrm.pbf

CMD     osrm-routed /maps/map.osrm

EXPOSE 5000
