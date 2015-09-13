#! /bin/bash
# Thanks to Dave Dopson @ stackoverflow for this script.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

CUR_DIR=`pwd`

if [ $# -ne 1 ] 
then
  echo "Use default project name"
  PRJ_NAME="sample-project"
else
  PRJ_NAME=$1
fi

echo "Creating $PRJ_NAME ........"

# copy project files
cp -r $DIR/sample-project $CUR_DIR/$PRJ_NAME
# modify project name
cd $CUR_DIR/$PRJ_NAME
find . -type f -print0 | xargs -0 sed -i "s/sample-project/$PRJ_NAME/" *.*
echo "Done"
