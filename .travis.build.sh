#! /bin/sh
set -e

ncpus=1
if test -x /usr/bin/getconf; then
    ncpus=$(/usr/bin/getconf _NPROCESSORS_ONLN)
fi

echo "Timestamp" && date
cmake ..
echo ""
echo "Timestamp" && date
echo "Starting build with -j$ncpus ..."

make -j$ncpus

# Run tests
#echo "Timestamp" && date
#make test
