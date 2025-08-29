if [ "$EUID" -ne 0 ]
  then echo "Please run as root or sudo"
  exit
fi
clear
echo "-------------------------------"
echo "This script is for Ubuntu 20.04"
echo "-------------------------------"
echo "     Updating Repositories     "
sudo apt-get update > /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR: Failed"
    exit
fi
echo "-------------------------------"
echo "        Installing Curl        "
sudo apt-get install curl -y > /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR: Failed"
    exit
fi
echo "-------------------------------"
echo "     Installing NodeJS 16.x    "
echo "-------------------------------"
echo "Adding the NodeSource repository"
echo "-------------------------------"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - > /dev/null
echo "           Installing          "
sudo apt-get install -y nodejs > /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR: Failed"
    exit
fi
echo "-------------------------------"
echo "  Installing C/C++ (gcc & g++) "
sudo apt-get install gcc g++ -y > /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR: Failed"
    exit
fi
echo "-------------------------------"
echo "      Installing Python 3      "
sudo apt-get install python3 python3-pip -y > /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR: Failed"
    exit
fi
echo "-------------------------------"
echo "        Installing Perl        "
sudo apt-get install perl -y > /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR: Failed"
    exit
fi
echo "-------------------------------"
echo "Done"
