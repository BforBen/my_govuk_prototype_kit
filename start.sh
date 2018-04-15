#!/bin/bash
clear

# Remove old prototype kit downloads
rm -rf govuk_prototype_kit-*

echo
echo ==================================
echo \|  GOV.UK Prototype Kit installer   \|
echo ==================================
echo
echo Please enter a project name with no spaces and press enter:

# Get folder name from user
read projectname

echo
echo Downloading the latest kit and extracting to the folder $projectname
echo This should take about a minute.
echo

# Download latest kit and extract
wget --quiet -O latest.zip https://govuk-prototype-kit.herokuapp.com/prototype-admin/download-latest && unzip -qq latest.zip && rm latest.zip

# Find extract folder as we don't know the latest version number
kitfolder=$(find . -maxdepth 1 -type d -name govuk_prototype_kit-\* -print | head -n1)

# Rename folder
mv $kitfolder ./$projectname

# Change to the folder and run npm install.
cd $projectname

echo Running npm install to download and install any dependencies.
echo This should take about 5 minutes.
echo

npm install

# Setup done
echo
echo
echo
echo ===================================================
echo \| The prototype kit is now setup and ready to go. \|
echo ===================================================
