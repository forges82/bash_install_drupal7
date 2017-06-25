#!/bin/bash
drush7 dl drupal --drupal-project-rename=drupal
mv drupal/* .
mv drupal/.htaccess .
mv drupal/.editorconfig .
mv drupal/.gitignore .
rmdir drupal
drush site-install standard --db-url='mysql://[db_user]:[db_pass]@localhost/[db_name]' --site-name=Example --account-name=admin --account-pass=[useruser_pass]
drush7 dis toolbar overlay --y
drush7 en admin_menu module_filter admin_views coffee fpa zen --y
drush7 cc all
drush7 zen personalizado
drush7 vset theme_default personalizado
chown -R www-data:www-data .
chmod 644 . -R
chmod 440 .htaccess
chmod 440 sites/default/settings.php
chmod 775 sites/default/files/ -R
