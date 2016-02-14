FROM drupal:8
MAINTAINER Clement Patout

ADD ./default.settings.php /var/www/html/sites/default/default.settings.php
ADD ./settings.local.php /var/www/html/sites/default/settings.local.php
ADD ./development.services.yml /var/www/html/sites/development.services.yml

RUN chown -R www-data:www-data /var/www/html/sites

VOLUME /var/www/html/
