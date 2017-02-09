FROM quay.io/pires/docker-elasticsearch:5.2.0

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery

RUN /elasticsearch/bin/elasticsearch-plugin install ingest-attachment --batch