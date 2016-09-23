FROM java:8u66-jre
MAINTAINER Adrian Haasler García <dev@adrianhaasler.com>

# Configuration
ENV JIRA_HOME /data/jira

# Install dependencies
RUN apt-get update && apt-get install -y \
	curl \
	tar \
	xmlstarlet

# Create the user that will run the jira instance and his home directory (also make sure that the parent directory exists)
RUN mkdir -p $(dirname $JIRA_HOME) \
	&& useradd -m -d $JIRA_HOME -s /bin/bash -u 547 jira
