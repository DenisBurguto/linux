#!/bin/bash

#• Создать скрипт ownersort.sh, который в заданной папке копирует
#файлы в директории, названные по имени владельца каждого файла.
#Учтите, что файл должен принадлежать соответствующему владельцу.

folder=$1

if [ -z "$folder" ]
  then
    echo 'Missed folder name'
    exit 1
  fi

if [ ! -d "$folder" ]
  then
    echo "Folder $folder doesn't exist"
    exit 1
  fi

for file in "$folder"/*
  do
    if [ -f "$file" ]
			then
      	owner=$(stat -c "%U" "$file")
      	owner_folder="$folder/$owner"
      
    		if [ ! -d "$owner_folder" ]
			  	then
      			mkdir "$owner_folder"
						echo "creating owner's folder "$owner_folder""
    		fi
    		mv "$file" "$owner_folder"
				chown "$owner" "$owner_folder"
				echo "moving "$file" to "$owner_folder""
  		fi
	done
