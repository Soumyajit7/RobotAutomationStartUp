# RobotAutomationStartUp
A readymade automation setup using robot framework

# Create a virtual environment
python -m venv myenv

# Activate the virtual environment
# On Windows
myenv\\Scripts\\activate

# On macOS and Linux
source myenv/bin/activate

python -m pip install --upgrade pip

# If requirements.txt is missing, Create requirements.txt for dependancy libraries
pip freeze > requirements.txt

# Install all dependancy libraries
pip install -r requirements.txt

