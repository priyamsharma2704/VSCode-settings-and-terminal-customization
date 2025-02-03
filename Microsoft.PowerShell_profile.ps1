# from terminal type: code $PROFILE or notepad $PROFILE
function aliases {
    Write-Host "Available Shortcuts:" -ForegroundColor Green
    Write-Host "===================" -ForegroundColor Green
    Write-Host "ctt     : Run Chris Titus Windows script" -ForegroundColor Cyan
    Write-Host "gs      : Git status" -ForegroundColor Cyan
    Write-Host "ga      : Git add all changes" -ForegroundColor Cyan
    Write-Host "gc      : Git commit with message" -ForegroundColor Cyan
    Write-Host "next    : Change directory to NextJS projects" -ForegroundColor Cyan
    Write-Host "react   : Change directory to React projects" -ForegroundColor Cyan
    Write-Host "js      : Change directory to JavaScript projects" -ForegroundColor Cyan
    Write-Host "ws      : Windsurf command" -ForegroundColor Cyan
    Write-Host "aliases : Show this list of shortcuts" -ForegroundColor Cyan
}


function ctt{
    irm "https://christitus.com/win" | iex
}

function gs
{
	git status
}

function ga
{
	git add .
}

function gc
{
	git commit -m "$args"
}

function next
{
	cd "C:\Dev\NextJS"
}

function react
{
	cd "C:\Dev\React"
}

function js
{
	cd "C:\Dev\JavaScript"
}

function ws
{
    param($Parameter1)
    windsurf $Parameter1
}

# Powershell Prompt customization
function prompt {
    $branch = git branch --show-current 2>$null
    $gitStatus = $null
    if ($branch) {
        $gitStatus = git status -s
        $uncommittedChanges = $gitStatus.Count
    }

    Write-Host "📁 " -NoNewline -ForegroundColor Blue
    if ($branch) {
        $branchColor = $uncommittedChanges -gt 0 ? "Yellow" : "Green"
        Write-Host "$(Get-Location) " -NoNewline
        Write-Host "🌿 " -NoNewline -ForegroundColor Green
        Write-Host "[$branch]" -ForegroundColor Cyan -NoNewline
        if ($uncommittedChanges -gt 0) {
            Write-Host " [+$uncommittedChanges]" -NoNewline -ForegroundColor Yellow
        }
        return " > "
    }
    else {
        return "$(Get-Location) > "
    }
}
