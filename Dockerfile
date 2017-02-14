FROM quay.io/pires/docker-elasticsearch:5.2.0

MAINTAINER peter@binder.works

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery

RUN /elasticsearch/bin/elasticsearch-plugin install ingest-attachment --batch && \
    wget -qO- http://apache.mirror.digitalpacific.com.au/james/mime4j/0.7.2/apache-mime4j-0.7.2-bin.zip -O apache-mime4j-0.7.2-bin.zip && \
    unzip apache-mime4j-0.7.2-bin.zip && \
    cp apache-mime4j-0.7.2/lib/apache-mime4j-* /elasticsearch/lib/ && \
    rm -rf apache-mime4j-*