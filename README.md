# Mailin Docker Image

This repository contains the neccessary files to build and run your own containerized [Mailin](https://github.com/Flolagale/mailin) instance. The container is designed to run standalone or on OpenShift Origin.

## Installation

This image is available on DockerHub. To pull it, run:

```
docker pull computersciencehouse/mailin
```

## Usage

This image expects the following environment variables to be set to properly run:

- `WEBHOOK_URL` should be set to the full URL of your webhook receiver

When the image is run, the application will listen for incoming email on port 2525.
