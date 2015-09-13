#! /bin/bash

# Thanks to Dave Dopson @ stackoverflow for this script.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo "Linking...."
sudo ln -s $DIR/sbt-prj-generator.sh /usr/local/bin/sbt-prj-generator
echo "Linking....done"
echo "You can use command sbt-prj-generator @project-name to create a new sbt project"
