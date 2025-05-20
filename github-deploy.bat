@echo off
echo Starting GitHub Pages deployment...

cd /d D:\Cursor\ASDFGHJK\public

echo Checking if Git is installed...
where git >nul 2>nul
if errorlevel 1 (
    echo Error: Git is not installed
    echo Please download and install Git from https://git-scm.com/downloads
    pause
    exit /b 1
)

echo.
echo Cleaning existing Git configuration...
if exist .git (
    echo Found existing Git repository, removing...
    rmdir /s /q .git
    echo Git repository removed.
) else (
    echo No existing Git repository found.
)

echo.
echo Setting up Git configuration...
set git_name=JiaYu Jin
set git_email=jiayujinn@gmail.com
set repo_url=https://github.com/jiayujinn/ASDFGHJK.git

git config --global user.name "%git_name%"
git config --global user.email "%git_email%"

echo.
echo Git configuration set to:
echo Name: %git_name%
echo Email: %git_email%
echo.

echo Initializing Git repository...
git init
if errorlevel 1 (
    echo Error: Failed to initialize Git repository
    pause
    exit /b 1
)

echo.
echo Adding remote repository...
git remote add origin %repo_url%
if errorlevel 1 (
    echo Error: Failed to add remote repository
    pause
    exit /b 1
)

echo.
echo Adding files...
git add .
if errorlevel 1 (
    echo Error: Failed to add files
    pause
    exit /b 1
)

echo.
echo Committing changes...
git commit -m "Update files"
if errorlevel 1 (
    echo Error: Failed to commit changes
    pause
    exit /b 1
)

echo.
echo Force pushing to GitHub...
git push -f origin master
if errorlevel 1 (
    echo Error: Failed to push to GitHub
    pause
    exit /b 1
)

echo.
echo Deployment completed successfully!
echo.
echo To enable GitHub Pages:
echo 1. Go to your repository on GitHub
echo 2. Click Settings
echo 3. Scroll down to GitHub Pages section
echo 4. Select 'master' branch as source
echo 5. Click Save
echo.
echo Your site will be available at: https://jiayujinn.github.io/ASDFGHJK
echo.
pause 