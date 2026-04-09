## Build the shit! 
## This is mostly build server section, 
## but fuck me and my cant save shit, its even more of a mess today
https://www.youtube.com/watch?v=vu2NK5REvWM&t=11s


####   help with <REPONAME>
## we just need to pull the www folder.
## this step is the magic aka "The Prestige"   
## after we demo we have someone edit / update the repo, and pull it
## proof it not all smoke and mirrros

## BUILD SECTION

su -

cd /tmp/
git clone https://github.com/Duru-E/DevOps-Demo.git
sleep 5
cd DevOps-Demo/
git pull
sleep 5

docker build -t nginxdemo --no-cache .

## save it   (Drewe fix the path)
docker save nginxdemo -o /mnt/share/nginxdemo.tar

## (h for human ~25MB i think)
ls -lh /mnt/share/nginxdemo.tar     

## END

## find that fresly minted image
docker images 

## run that shit 
docker run -d -p 80:80 --name nginxdemo nginxdemo

## Look at it running in all its glory
docker ps

## now view the eye candy
http://127.0.0.1/

## had enough? shut it down
docker stop nginxdemo

## good by crule world that container with a bang
docker rm nginxdemo

## What the f is actually going on?
docker rm nginxdemo

##########
## once we prove this process we save it to a new file called
<Script_Name>.sh
## to run
.\<Script_Name>.sh
#####################

----------------------------------------------------------
---		final outcome   

---		docker reads dockerfile
---		downloads nginx running on alpine linux
---		deletes the default website
---		copys my sweet ass webpage you all love
---		builds docker IMG
---		saves docker IMG to tarball
---
---		This is the single source of truth
---		All server that will host a container will use this IMG
---		the Demo Laptop (2 if we can get more) will fire up a container based on this img
---------------------------------------------------------

## Host the container and serve the world (or class room)
## yes i use lots of non powershell commands im old,
## i lost the last version and this works and you can learn on your own time

Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"

## drewe fill in the samba credientials and real share path
net use o: \\192.168.2.254\Storage /user:smbuser smb  (net use o: /delete if you done fucked up)
timeout /t 60

## if your cool (katie) you write a validation that the file transfer is done being coppied
## how do i do that?  you look at the last modified time and make sure its 10+ seconds from being messed with
## or do it another way i dont care I used a timeout with no validation
## also is the docker engine done loading? how would i know, i didnt run ' Get-Process '  
## im lazy and asumed your computer could do it in 60 seconds or less

docker load -i o:\nginxdemo.tar

## use docker run -d -p 127.0.0.1:8123:80 if you are feelying cheeky
docker run -d -p 80:80 --name nginxdemo nginxdemo
timeout /t 60

## once again, cool kids will use a validation i used a timeout 10 seconds should be plenty....
## but we also need to draw this out and talk some shit about devops

Start-Process "http://127.0.0.1/"

## some cleanup
docker stop nginxdemo
docker rm -f nginxdemo
docker image rm nginxdemo 

#####################################################


cool demo works (or i cry) we explained devops almost
Now we do it all again a second time

We pull an audience memeber from the crowd
or two even

either on git hub directly or on another laptop via CLI
We have them update the index.html

Push to git, merge you know the drill

once git syncs we pull it all back down, build it again
The wow the shit out of them with the message they wrote without us seing it
100% proof this is not fake

Devops has been explained with cryons ELI5 : Devops
