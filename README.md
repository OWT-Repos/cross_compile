Here you will find the following bash scripts that need to be run in order to cross-compile the GUI:

## First enable GL (FAKE KMS)
To enable Fake KMS, type sudo `raspi-config` on your terminal to open a menu, then go to:
```
Advanced Options -> A8 GL Driver -> G2 GL (Fake KMS)
```
That should enable KMS. Choose Finish finally and exit.

## Bash scripts
`raspberry_script.sh` must be run in the Raspberry Pi 4 to install all required dependencies.

`env_script.sh` must be run in the host machine to setup the Qt and cross-compiling environment. This scripts is targeted for Ubuntu 20.04 machines, therefore if you're using a Windows machine I recommend using WSL with Ubuntu 20.04. **You must set the RPI4_IP variable in this file**

`build.sh` must be run in the host machine to build the Qt and synchronize it with the Raspberry Pi 4. **You must set the RPI4_IP variable in this file**

Commands present in `mysql_create.sql` must be run in the MySQL server in the Raspberry Pi 4.

The file `config.ini` from the code repository must be copied to the home folder in the Rasberry Pi 4, in this case to the folder `/home/pi`.