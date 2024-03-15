#!/bin/bash

<<task
This script will take backups from source to target and
extract the file in target directory
task

create_backups(){
src_dir="/home/vagrant/scripts"
tgt_dir="/home/vagrant/backups"

backup_filename="backup_$(date +%Y-%m-%d-%H-%M-%S).tar.gz"

echo "Backup in progess $backup_filename ......."
echo "Backup Started"

tar -czvf "${tgt_dir}/$backup_filename" "$src_dir"

echo "Backup Completed"

echo "Extraction In Progress....."

cd $tgt_dir

tar -xzvf "$backup_filename"

echo "Extrated sucessfully in target directory"
}

create_backups
