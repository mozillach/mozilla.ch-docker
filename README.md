# mozilla.ch Docker Image

The files in this repository are used to generate a production image for
mozilla.ch. It is available as mozillach/mozilla.ch from the docker hub.

## Creating the Image
Make sure you have docker installed.

Run `docker build -t mozillach/mozilla.ch` to build the docker image.

## Running the Container

Replace `{mozillians API key}` with a mozillians API key for the v2 API with public access privileges.

Run `docker run -e MOZILLIANS_KEY={mozillians API key} mozillach/mozilla.ch` to start provisioning and then start apache.

To run it in a deployment situation use `docker run -h mozilla.ch -p 80:80 -d -e "MOZILLAINS_KEY={mozillians API key}" mozillach/mozilla.ch`.

foo
