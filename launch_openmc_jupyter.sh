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






