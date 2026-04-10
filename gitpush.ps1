cls
write-host "This will update to current build" -ForegroundColor DarkMagenta
 
git clone https://github.com/Duru-E/DevOps-Demo.git
git pull


write-host "deal with the errors, im not writting if statements, this works" -ForegroundColor Magenta
Write-host "Make a branch for the demo"  -ForegroundColor DarkMagenta

git checkout The_Prestige
git checkout -b The_Prestige


write-host "Adding the change, stage and commit" -ForegroundColor DarkMagenta
write-host "Ctrl + C to Cancel" -ForegroundColor DarkRed
pause 

git add .
git commit -m "Added with push script"
git push origin The_Prestige

