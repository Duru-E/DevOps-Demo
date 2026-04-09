function loadingAnimation() {
    param(
        [int]$numAnimations
    )

    for ($i = 0; $i -lt $numAnimations; $i++){
    for ($j = 0; $j -lt 3; $j++){
        Write-Host "." -NoNewline
        Start-Sleep -Seconds 1
    }
    Write-Host "`r   `r" -NoNewline
}
}

#Variables
$Fail = $false

#check that docker is installed on current system
try {
docker -v -ErrorAction Stop
}catch{
$Fail = $true
Write-Host "docker not installed, please install docker and try again."
Pause
}

#if docker is installed start local web server
if (!$Fail){
    #start docker
    docker desktop start

    #access build server file share
    net use o: \\192.168.2.254\Storage /user:smbuser smb
    loadingAnimation(10)

    #load docker image and run web server
    Write-Host "Download docker image"
    docker load -i o:\nginxdemo.tar
    Write-Host "Starting webserver container"
    docker run -d -p 80:80 --name nginxdemo nginxdemo
    loadingAnimation(10)

    #open webserver in browser
    Write-Host "Opening webserver in browser"
    Start-Process "http://127.0.0.1/"

    #wait for the user to be finished with the webserver
    Write-Host "Press enter to stop webserver"
    Pause

    ##cleanup
    Write-Host "Stopping webserver and removing container"
    docker stop nginxdemo
    docker rm -f nginxdemo
    docker image rm nginxdemo
    }

