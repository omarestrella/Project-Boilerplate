-- Project boilerplate setup script
-- Written by Omar Estrella
-- Version 0.1
-- Licensed under the WTFPL

set the base_folder to choose folder with prompt "Choose base directory…"
set base_folder to quoted form of the POSIX path of base_folder

-- Choose the type of project we will create
set project_type to choose from list {"Django", "Ruby on Rails"} with title "Choose a project type…" with prompt "Project Type" default items "Django" OK button name "Select" without multiple selections allowed and empty selection allowed

-- Choose the name for the project
set project_name to text returned of (display dialog "Project name" default answer "Project" buttons {"Set"} default button "Set" with title "Choose a project name…" without hidden answer)

-- Handle the Django project
if project_type contains "Django" then
	-- Create VE
	do shell script "cd " & base_folder & "; /usr/local/bin/virtualenv " & project_name & " --distribute --no-site-packages"
	
	-- Activate VE and install Django and South
	do shell script "cd " & base_folder & "/" & project_name & "; source bin/activate; pip install django south"
	
	-- Create local django project
	do shell script "cd " & base_folder & "/" & project_name & "; source bin/activate; django-admin.py startproject run"
else
	display alert "Cannot continue…"
end if