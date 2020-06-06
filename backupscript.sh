#!/bin/bash

# Database credentials
user=""
password=""
host="localhost"
db_name=""

backup_path="backup"
date=$(date +"%d-%b-%Y")

dirname_to_zip=""
zip_filename="$backup_path/$date-BACKUP-$dirname_to_zip.zip"

# uncomment following code to delete all sql and zip files in backup path
#cd $backup_path
#rm -rf *.sql *.zip
#cd ..

# Set default file permissions
umask 177

echo "=== start saving the database ==="
mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql
echo "=== database is saved ==="
echo "=== start zipping $dirname_to_zip ==="
zip -r $zip_filename $dirname_to_zip
echo "=== $zip_filename has been created ==="