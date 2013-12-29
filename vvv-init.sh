# Init script for VVV GlotPress

echo "Commencing VVV GlotPress Setup"

# Make a database, if we don't already have one
echo "Creating database (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS glotpress"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON glotpress.* TO gp@localhost IDENTIFIED BY 'gp';"

# Download GlotPress
if [ ! -d htdocs ]
then
	echo "Checking out GlotPress SVN"
	svn checkout http://glotpress.svn.wordpress.org/trunk/ htdocs
	cp htdocs/gp-config-sample.php htdocs/gp-config.php
	sed -i 's/username/gp/g' vagrant htdocs/gp-config.php
	sed -i 's/password/gp/g' htdocs/gp-config.php
else
	echo "Updating GlotPress SVN"
	svn up htdocs
fi

# The Vagrant site setup script will restart Nginx for us

echo "GlotPress trunk site now installed";
