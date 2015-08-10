FROM debian:jessie
# Built from debian, so we have no clutter (like mysql).

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && apt-get install -yq git php5 php5-intl php5-curl libapache2-mod-php5 curl

# Apache stuff
# Adjust timezone to match server time...
RUN echo 'date.timezone = "Europe/Zurich"' >> /etc/php5/apache2/php.ini && \
    echo 'date.timezone = "Europe/Zurich"' >> /etc/php5/cli/php.ini

RUN a2enmod php5
RUN a2enmod rewrite
ADD mozillach.conf /etc/apache2/sites-enabled/000-default.conf

# Setup the environement
RUN git clone https://github.com/mozillach/mozilla.ch.git /var/www/main

ENV SYMFONY_ENV prod

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin

# Open port 80
EXPOSE 80

# Run stuff
ADD start.sh /opt/start.sh
CMD [ "/opt/start.sh" ]