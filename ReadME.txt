## Devops has been explained with cryons ELI5 : Devops

We have created a simple webpage and we want to host it on a webserver. We have chosen nginx as our webserver and we want to run it in a container. We will use docker to create a container image that will host our webpage. We will then run this container on our demo laptops.
We have created a dockerfile that will build our container image. The dockerfile will download nginx running on alpine linux, delete the default website, copy our webpage to the container and build the docker image. We will then save this docker image to a tarball and share it on our network. The demo laptops will then load this docker image and run it as a container.


## Our Setup
We have a router and laptop setup allowing us to have a local network while still having internet access.
We have a build server that will build our docker image and share it on the network.
We have demo laptops that will access the shared docker image, load it and run it as a container.


## BUILD SECTION
We have created a build-script file that we run on our build server after each merge to main.
This script will pull the latest changes from the repository, build the docker image and save it to a tarball on a network share.


## Host the container
We have created a RunDockerScript that runs Docker, loads the docker image from the tarball and runs it as a container.
We will run this script on our demo laptops to host the webpage on nginx. We can then access the webpage from our browser.