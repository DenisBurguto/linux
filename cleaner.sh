#!/bin/bash

#• Написать скрипт очистки директорий.
#На вход принимает путь к директории.
#Если директория существует, то удаляет в ней все файлы с расширениями .bak, .tmp, .backup.
#Если директории нет, то выводит ошибку.


folder=$1

if [ -z "$folder" ]
  then
    echo 'Missed folder name'
    exit 1
  fi

removed=0

if [ -d "$folder" ]
  then
    echo "Searching for waist  files in folder $folder and deleting them"
    for file in "$folder"/*
      do
        if [[ $file == *.bak || $file == *.tmp || $file == *.backup ]]
           then
             rm "$file" && removed=$((removed + 1))
           fi
      done
    echo "Total removed files quantity: $removed"
  else
    echo "Folder $folder doesn't exist"
    exit 1
  fi
