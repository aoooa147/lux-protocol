# Push LUX Protocol to GitHub
# Run this script from the protocol/ directory

Write-Host "🚀 Pushing LUX Protocol to GitHub..." -ForegroundColor Cyan

# Check if git is initialized
if (-not (Test-Path .git)) {
    Write-Host "Initializing git repository..." -ForegroundColor Yellow
    git init
}

# Add all files
Write-Host "Adding files..." -ForegroundColor Yellow
git add .

# Check if user config is set
$userName = git config user.name
$userEmail = git config user.email

if (-not $userName -or -not $userEmail) {
    Write-Host "⚠️  Git user.name or user.email not set" -ForegroundColor Yellow
    Write-Host "Please run:" -ForegroundColor Yellow
    Write-Host "  git config --global user.name 'Your Name'" -ForegroundColor White
    Write-Host "  git config --global user.email 'your.email@example.com'" -ForegroundColor White
    Write-Host ""
    Write-Host "Or set locally for this repo:" -ForegroundColor Yellow
    Write-Host "  git config user.name 'Your Name'" -ForegroundColor White
    Write-Host "  git config user.email 'your.email@example.com'" -ForegroundColor White
    exit 1
}

# Commit
Write-Host "Creating commit..." -ForegroundColor Yellow
git commit -m "Initial commit: LUX Protocol

- ABIs for LUX Token and Staking contracts
- Developer documentation (README, QUICK_START, API_REFERENCE)
- Contract addresses and network configuration
- MIT License"

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Commit failed. Files may already be committed." -ForegroundColor Red
    Write-Host "Checking status..." -ForegroundColor Yellow
    git status
    exit 1
}

# Check if remote exists
$remoteExists = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Adding remote repository..." -ForegroundColor Yellow
    git remote add origin https://github.com/aoooa147/lux-protocol.git
} else {
    Write-Host "Remote already exists: $remoteExists" -ForegroundColor Green
}

# Set branch to main
Write-Host "Setting branch to main..." -ForegroundColor Yellow
git branch -M main

# Push
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "⚠️  You may need to authenticate with GitHub" -ForegroundColor Yellow
Write-Host "   Use Personal Access Token if prompted for password" -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host "   Repository: https://github.com/aoooa147/lux-protocol" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Push failed. Common issues:" -ForegroundColor Red
    Write-Host "   1. Authentication required (use Personal Access Token)" -ForegroundColor Yellow
    Write-Host "   2. Repository may not exist or you don't have access" -ForegroundColor Yellow
    Write-Host "   3. Check your internet connection" -ForegroundColor Yellow
}

