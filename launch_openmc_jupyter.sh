#!/bin/bash
#load conda
source ~/miniforge3/etc/profile.d/conda.sh  # adjust if you use Anaconda or it's in a different path
conda activate OpenMC-Env01

jupyter notebook --no-browser --ip=127.0.0.1 > jupyter_log.txt 2>&1 &

sleep 10

url=$(grep -o 'http://127.0.0.1:[0-9]*/tree?token=[a-z0-9]*' jupyter_log.txt | head -n 1)

echo "Extracted URL: $url"


if [ -n "$url" ]; then
        /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe start "$url"

else
        echo "failed to extract URL"


fi

wait


###############
###############
###############

#Option to remove token from jupyter 

#File path -  cd /home/user/miniforge3/envs/OpenMC-Env01/lib/python3.11/site-packages/notebook_shim/tests/confs/

#edit - jupyter_notebook_config.py  
## Don't require token for browser
#c.NotebookApp.token = ''
#c.NotebookApp.password = ''

## Automatically open in browser
#c.NotebookApp.open_browser = True

## Set the IP and port
#c.NotebookApp.ip = 'localhost'
#c.NotebookApp.port = 8888  # or any available port


