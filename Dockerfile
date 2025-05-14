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
drush php-eval "Drupal\experience_builder\Entity\Page::create(['title' => 'Page 1'])->save();"
chown -R www-data:www-data web/sites
END
