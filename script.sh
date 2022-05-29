#!/bin/bash
echo "Hi user"
firstline=$(head -1 source/changelog.md)
read -a firstlinesplit <<< $firstline
version=${firstlinesplit[1]}
echo $version
echo "Press 1 for continue or Press 0 for exit "
read versioncontinue
if [ $versioncontinue -eq 1 ]
then 
  echo 'OK'
  for filename in source/*
  do 
    echo $filename
    if [ $filename == "source/secretinfo.md" ]
    then 
      echo "Not copying" $filename
    else 
      echo "copying" $filename
      cp $filename build
  fi
done
else 
echo 'Please come back when you are ready.'
fi
cd build 
echo "Build version $version contents:"
ls
