#!/usr/bin/env bash

# source this file to load the environment variables and functions
# customized for the project

#####################################################################################

if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
    echo "You should source this script, not execute it!"
    exit 1
fi

#
# This method returns the path ater resolving soft-links. 
# Hence the PROJ_TREE_TOP is specified as relative path to the actual file, not the link
#
SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
#PROJ_TREE_TOP=$(realpath $SCRIPT_DIR/../..)


#
# This method returns the location of the script link (i.e. the project tree top)
#
SCRIPT_LINK_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJ_TREE_TOP=$(realpath $SCRIPT_LINK_DIR)

echo "********************************************************************************"
echo ""
echo ""
echo "                  Initializing the project environment.   "
echo ""
echo "  Script directory  : $SCRIPT_DIR"
echo "  PROJ_TREE_TOP     : $PROJ_TREE_TOP"
echo ""

cd $PROJ_TREE_TOP

#
# Show the current repo status
#
repo list

echo ""
echo "********************************************************************************"

#####################################################################################

repo-init-chronos-skp()
{

        repo init -u http://pve1.ngrn.a-star.edu.sg:8880/skp-pvt/chronos-urllc-top.git
}

repo-init-chronos-5gamsus()
{

        repo init -u  http://pve1.ngrn.a-star.edu.sg:8880/5g-projects/chronos-sib9-repo.git
}

repo-sync-noS1()
{
        repo sync -c -m oai-noS1-chronos.xml
}

repo-sync-default()
{
        repo sync -c -m default.xml
}
#####################################################################################