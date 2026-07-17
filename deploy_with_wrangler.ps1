<#
PowerShell helper to publish this folder to Cloudflare Pages using Wrangler.

Usage (interactive):
  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
  .\deploy_with_wrangler.ps1

Or provide parameters:
  .\deploy_with_wrangler.ps1 -ProjectName "my-pages-project"

This script will only print recommended commands and attempt to run `wrangler pages publish` if `wrangler` is available.
#>

param(
  [string]$ProjectName = "",
  [string]$AccountId = "",
  [string]$ApiToken = ""
)

Write-Host "This helper shows how to publish this folder to Cloudflare Pages." -ForegroundColor Cyan

if (-not (Get-Command wrangler -ErrorAction SilentlyContinue)) {
  Write-Host "wrangler CLI not found. Install it with: npm install -g wrangler" -ForegroundColor Yellow
  Write-Host "Or run: npm i -g wrangler" -ForegroundColor Yellow
}

Write-Host "Recommended commands:" -ForegroundColor Green
Write-Host "  # login interactively:" -ForegroundColor DarkGreen
Write-Host "  wrangler login" -ForegroundColor DarkGreen
Write-Host "  # then publish from this folder (replace PROJECT_NAME):" -ForegroundColor DarkGreen
Write-Host "  wrangler pages publish . --project-name $ProjectName" -ForegroundColor DarkGreen

if ($ProjectName) {
  if (Get-Command wrangler -ErrorAction SilentlyContinue) {
    Write-Host "Attempting to publish with wrangler..." -ForegroundColor Cyan
    & wrangler pages publish . --project-name $ProjectName
  } else {
    Write-Host "wrangler not installed; aborting automated publish." -ForegroundColor Red
  }
}

Write-Host "If you prefer GitHub <> Cloudflare Pages integration, push this repo to GitHub and connect it from the Cloudflare dashboard." -ForegroundColor Cyan
