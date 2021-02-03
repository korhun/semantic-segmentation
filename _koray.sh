# https://stackoverflow.com/questions/40313633/how-to-copy-files-from-local-machine-to-docker-container-on-windows
docker ps --format "{{.Names}}"
docker cp C:\_koray\temp\nvidia\seg_weights awesome_wiles:/home/koray/assets
git clone https://github.com/korhun/semantic-segmentation.git