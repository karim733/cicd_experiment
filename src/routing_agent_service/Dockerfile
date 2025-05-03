# Use the official Debian-hosted Python image
FROM python:3.11-slim-buster

# Tell pipenv where the shell is. 
# This allows us to use "pipenv shell" as a container entry point.
ENV PYENV_SHELL=/bin/bash

# Ensure we have an up to date baseline, install dependencies 
RUN set -ex; \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends build-essential git && \
    pip install --no-cache-dir --upgrade pip && \
    pip install pipenv && \
    mkdir -p /app

WORKDIR /app

# Add Pipfile, Pipfile.lock
#ADD Pipfile Pipfile.lock /app/
ADD Pipfile /app/
RUN pipenv lock

RUN pipenv sync

# Source code
ADD . /app

RUN pipenv install --system --deploy

RUN chmod +x docker-entrypoint.sh

EXPOSE 8001

ENTRYPOINT ["/bin/bash","docker-entrypoint.sh"]