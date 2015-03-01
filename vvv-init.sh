# Init script for your neat site

echo "Commencing My Neat Site Setup"

# Make a database, if we don't already have one
# You can change the table name to anything you like
echo "Creating database (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS my_neat_site"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON my_neat_site.* TO wp@localhost IDENTIFIED BY 'wp';"

# Download WordPress using WP CLI which is already installed with VVV
echo "Installing WordPress using WP CLI"
mkdir htdocs
cd htdocs
wp core download 
wp core config --dbname="my_neat_site" --dbuser=wp --dbpass=wp --dbhost="localhost"
wp core install --url=my-neat-site.dev --title="My Neat Site" --admin_user=admin --admin_password=password --admin_email=demo@example.com
cd ..

# Let the user know the good news
echo "My Neat Site now installed";