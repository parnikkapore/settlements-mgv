#! /bin/bash
# Put this in a test world's folder
# Execute it to reset the world

for file in $(ls -I auth.sqlite -I map_meta.txt -I players.sqlite -I world.mt -I reset.sh); do
    rm -v "$file"
done
