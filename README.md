# mozilla.ch Docker Image

The files in this repository are used to generate a production image for
mozilla.ch.

## Creating the Image
Make sure you have docker installed.

Run `docker build -t mozillach/mozilla.ch` to build the docker image.

## Running the Container

Replace `{mozillians API key}` with a mozillians API key for the v2 API with public access privileges.

Run `docker run -e MOZILLIANS_KEY={mozillians API key} mozillach/mozilla.ch` to start provisioning and then start apache.
