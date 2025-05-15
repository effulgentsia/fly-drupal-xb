FROM drupal

COPY php.ini /usr/local/etc/php/conf.d/
COPY settings.php web/sites/default/
COPY patches/ patches/

SHELL ["/bin/bash", "-c"]
RUN <<END
set -e
patch -p1 -d web < patches/*.patch
composer require drupal/sqlite337:@alpha drupal/experience_builder:^0@alpha drush/drush
drush si standard
drush pm:install experience_builder
drush php-eval "Drupal\experience_builder\Entity\Page::create(['title' => 'Page 1', 'path' => '/home'])->save();"
drush config:set system.site page.front "/home"
chown -R www-data:www-data web/sites
END

# Add an additional entrypoint script but without changing the ENTRYPOINT or CMD
# commands from the base image.
RUN mv /usr/local/bin/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint-base
COPY --chmod=755 docker-entrypoint /usr/local/bin/docker-php-entrypoint
