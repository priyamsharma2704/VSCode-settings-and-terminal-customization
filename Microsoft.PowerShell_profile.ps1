# from terminal type: code $PROFILE or notepad $PROFILE
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
