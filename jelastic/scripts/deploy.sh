#!/bin/bash

# Simple deploy and undeploy scenarios for JBoss7

WGET=$(which wget);

function _deploy(){
     [ "x${context}" == "xroot" ] && context="ROOT";
     [ -f "${WEBROOT}/${context}.war" ] && rm -f ${WEBROOT}/${context}.war;
     [ -f "${WEBROOT}/${context}.ear" ] && rm -f ${WEBROOT}/${context}.ear;
     [ -f "${WEBROOT}/${context}.war.undeployed" ] && mv ${WEBROOT}/${context}.war.undeployed ${WEBROOT}/${context}.war.deployed
     [ -f "${WEBROOT}/${context}.ear.undeployed" ] && mv ${WEBROOT}/${context}.ear.undeployed ${WEBROOT}/${context}.ear.deployed
     $WGET --no-check-certificate --content-disposition "$package_url";
}

function _undeploy(){
     [ "x${context}" == "xroot" ] && context="ROOT";
     rm -f "${WEBROOT}/${context}.war" "${WEBROOT}/${context}.war.*" ;
     rm -f "${WEBROOT}/${context}.ear" "${WEBROOT}/${context}.ear.*" ;
}
