# Init script for VVV GlotPress

echo "Commencing VVV GlotPress Setup"

# Make a database, if we don't already have one
echo -e "\n Creating database 'glotpress' (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS glotpress"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON glotpress.* TO gp@localhost IDENTIFIED BY 'gp';"
echo -e "\n DB operations done.\n\n"

# Nginx Logs
if [[ ! -d /srv/logs/glotpress ]]; then
	mkdir /srv/logs/glotpress
	touch /srv/logs/glotpress/error.log
	touch /srv/logs/glotpress/access.log
fi

# Download GlotPress
if [ ! -d /srv/www/glotpress/src ]
then
	echo "Checking out GlotPress SVN"
	svn checkout http://glotpress.svn.wordpress.org/trunk/ /srv/www/glotpress/src
	cp /srv/www/glotpress/src/gp-config-sample.php /srv/www/glotpress/src/gp-config.php
	sed -i 's/username/gp/g' /srv/www/glotpress/src/gp-config.php
	sed -i 's/password/gp/g' /srv/www/glotpress/src/gp-config.php
else
	echo "Updating GlotPress SVN"
	svn up /srv/www/glotpress/src
fi

# The Vagrant site setup script will restart Nginx for us

echo "GlotPress trunk site now installed";
