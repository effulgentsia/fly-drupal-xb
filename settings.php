<?php

$databases['default']['default'] = array (
  'database' => 'sites/default/files/.ht.sqlite',
  'prefix' => '',
  'driver' => 'sqlite',
  'namespace' => 'Drupal\\sqlite337\\Driver\\Database\\sqlite',
  'autoload' => 'modules/contrib/sqlite337/src/Driver/Database/sqlite/',
  'dependencies' => 
  array (
    'sqlite' => 
    array (
      'namespace' => 'Drupal\\sqlite',
      'autoload' => 'core/modules/sqlite/src/',
    ),
  ),
);
