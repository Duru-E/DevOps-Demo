Write-Host "This will update to current build" -ForegroundColor DarkMagenta

$repo = "https://github.com/Duru-E/DevOps-Demo.git"
$cur = Get-Location

# if current dir is a git repo
if (Test-Path ".git") {
    $remoteUrl = git config --get remote.origin.url 2>$null
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrEmpty($remoteUrl)) {
        git remote remove origin 2>$null
        git remote add origin $repo
    } elseif ($remoteUrl -ne $repo) {
        git remote set-url origin $repo
    }
    git fetch origin
    git checkout main 2>$null
    git pull origin main
} else {
    # fetch into a temporary clone, copy contents into current dir (no new named folder)
    $tmp = Join-Path $env:TEMP ("tmprepo_{0}" -f ([guid]::NewGuid()))
    git clone --depth=1 $repo $tmp
    robocopy $tmp $cur /MIR /XD .git
    Remove-Item -Recurse -Force $tmp
}

Write-Host "Make a branch for the demo" -ForegroundColor DarkMagenta
$branch = 'The_Prestige'
if (git rev-parse --verify $branch 2>$null) { git checkout $branch } else { git checkout -b $branch }

Write-Host "Adding the change, stage and commit" -ForegroundColor DarkMagenta
Write-Host "Ctrl+C to cancel" -ForegroundColor DarkRed

git add .
git commit -m "Added with push script"

Pause

git push -u origin $branch
