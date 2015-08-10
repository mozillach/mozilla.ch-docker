FROM php:5.6-apache

ENV SYMFONY_ENV=prod

RUN apt-get update -q && apt-get install -yq git libicu-dev zlib1g-dev libicu52 zlib1g --no-install-recommends

# PHP config
# Adjust timezone to match server time...
RUN echo 'date.timezone = "Europe/Zurich"' >> /usr/local/etc/php/php.ini && \
    echo 'short_open_tag = off' >> /usr/local/etc/php/php.ini

RUN docker-php-ext-install intl mbstring zip opcache

# Clean up packages
RUN apt-get purge -y --auto-remove libicu-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Apache config
RUN a2enmod rewrite
COPY mozillach.conf /etc/apache2/sites-enabled/mozillach.conf

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin

# Setup the environement
RUN git clone https://github.com/mozillach/mozilla.ch.git /var/www/html

# Run stuff
COPY start.sh /opt/start.sh
CMD [ "/opt/start.sh" ]
