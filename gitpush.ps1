Write-Host "This will update to current build" -ForegroundColor DarkMagenta

$repo = "https://github.com/Duru-E/DevOps-Demo.git"
# if current folder is a git repo with that remote, pull; otherwise fetch into temp and copy
$remoteUrl = git config --get remote.origin.url 2>$null
if ($LASTEXITCODE -eq 0 -and $remoteUrl -eq $repo) {
    git pull origin main
} else {
    $tmp = Join-Path $env:TEMP ("tmprepo_{0}" -f ([guid]::NewGuid().ToString()))
    git clone $repo $tmp
    robocopy $tmp . /MIR /XD .git
    Remove-Item -Recurse -Force $tmp
}

Write-Host "Make a branch for the demo" -ForegroundColor DarkMagenta
$branch = 'The_Prestige'
if (git rev-parse --verify $branch 2>$null) { git checkout $branch } else { git checkout -b $branch }

Write-Host "Adding the change, stage and commit" -ForegroundColor DarkMagenta
Write-Host "Ctrl+C to cancel" -ForegroundColor DarkRed
Pause

git add .
git commit -m "Added with push script"
git push -u origin $br