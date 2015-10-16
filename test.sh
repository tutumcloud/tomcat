#!/bin/bash

set -e

tomcat_test()
{
    local version="$1"

    echo -e "\e[1m=> Building tomcat-${version} image...\e[0m"
    docker build -t tomcat-${version} ${version}

    echo -e "\e[1m=> Running tomcat-${version} container...\e[0m"
    local cid=$(docker run -d tomcat-${version})
    local cip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${cid})

    echo -e "\e[1m=> Testing tomcat-${version} serves Tomcat default page on http://${cip}:8080/...\e[0m"
    sleep 10
    wget --spider http://${cip}:8080/
}

tomcat_test 4.1
tomcat_test 5.5
tomcat_test 6.0
tomcat_test 7.0
tomcat_test 8.0
echo -e "\e[1m=> Done.\e[0m"
