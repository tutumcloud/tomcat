tutum-docker-tomcat
===================

**This image will be deprecated soon. Please use the docker official image:** https://hub.docker.com/_/tomcat/

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Base docker image to run a Tomcat application server


Image tags
----------
```
    tutum/tomcat:latest
    tutum/tomcat:8.0
    tutum/tomcat:7.0
    tutum/tomcat:6.0
    tutum/tomcat:5.5
    tutum/tomcat:4.1
```


Usage
-----

To create the image `tutum/tomcat`, execute the following command on the tutum-docker-tomcat folder:

    docker build -t tutum/tomcat .

To run the image and bind to port :

    docker run -d -p 8080:8080 tutum/tomcat


The first time that you run your container, a new user `admin` with all privileges
will be created in Tomcat with a random password. To get the password, check the logs
of the container by running:

    docker logs <CONTAINER_ID>

You will see an output like the following:

    ========================================================================
    You can now connect to this Tomcat server using:

        admin:b1uKcRK3r6SF

    Please remember to change the above password as soon as possible!
    ========================================================================

In this case, `b1uKcRK3r6SF` is the password allocated to the `admin` user.

You can now login to you admin console to configure your tomcat server:

    http://127.0.0.1:8080/manager/html
    http://127.0.0.1:8080/host-manager/html


Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `TOMCAT_PASS` to your specific password when running the container:

    docker run -d -p 8080:8080 -e TOMCAT_PASS="mypass" tutum/tomcat

You can now test your deployment:

    http://127.0.0.1:8080/

Done!

**by http://www.tutum.co**
