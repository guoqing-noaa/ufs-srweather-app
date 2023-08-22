#!/bin/sh
#
basedir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
srcdir="$basedir"/../src

echo "Apply a couple of code patches from the bridgeloan repository?(Y/N)" 
echo "    (If you are not sure what to do, please enter Y)" 
read YN
if [[ "$YN" == "N" ]]; then
  exit
fi

# clone the bridge loan repo
cd $srcdir
git clone --quiet https://github.com/NOAA-GSL/rrfs_bridgeloan >& /dev/null

# copy bridge loan codes into their final locations
set -x
#cp -r rrfs_bridgeloan/env/* ../env
cp -r rrfs_bridgeloan/gsi/* gsi/src/gsi
cp -r rrfs_bridgeloan/ufs_weather_model/* ufs_weather_model
