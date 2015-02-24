# Provision GlotPress site
echo -e "\n\n "
echo -e "\n=================================="
echo -e "\n Provision GlotPress site via SVN "
echo -e "\n=================================="

# Constants
DIR="$(dirname $SITE_CONFIG_FILE)"
DESTDIR="/srv/www/glotpress/src"
LOGDIR="/srv/log/glotpress.dev"

# Make a database, if we don't already have one
echo -e "\n Creating database 'glotpress' (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS glotpress"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON glotpress.* TO gp@localhost IDENTIFIED BY 'gp';"
echo -e "\n DB operations done.\n\n"

# Nginx logs
if [[ ! -d $LOGDIR ]]; then
	mkdir $LOGDIR
fi
	touch $LOGDIR/error.log
	touch $LOGDIR/access.log

if [[ ! -f $LOGDIR/logs.cfg ]]; then
	cp $DIR/logs.cfg $LOGDIR/
fi

# Download GlotPress
if [ ! -d $DESTDIR ]; then

	echo "Checking out GlotPress SVN..."

	svn checkout http://glotpress.svn.wordpress.org/trunk/ $DESTDIR
	cp $DESTDIR/gp-config-sample.php $DESTDIR/gp-config.php

	sed -i 's/username/gp/g' $DESTDIR/gp-config.php
	sed -i 's/password/gp/g' $DESTDIR/gp-config.php

	echo -e "\n\n "
	echo -e "\n\033[33;32m...GlotPress SVN installed.\033[0m"
	echo -e "\n "

else
	echo "Updating GlotPress SVN..."
	svn up $DESTDIR

	echo -e "\n\n "
	echo -e "\n\033[33;32m...GlotPress SVN updated.\033[0m"
	echo -e "\n "
fi
