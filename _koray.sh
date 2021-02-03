git clone --recursive https://github.com/korhun/semantic-segmentation.git -b sdcnet

docker login nvcr.io
# https://ngc.nvidia.com/setup/api-key

docker build --pull --rm -f "Dockerfile" -t semanticsegmentation:latest .
# docker build --rm -f "Dockerfile" -t semanticsegmentation:latest .

docker run --rm -it --name semseg -e NVIDIA_DRIVER_CAPABILITIES=compute -p 6006:6006/tcp -p 8888:8888/tcp semanticsegmentation:latest
# docker run -it --name semseg -e NVIDIA_DRIVER_CAPABILITIES=compute -p 6006:6006/tcp -p 8888:8888/tcp semanticsegmentation:latest

# https://stackoverflow.com/questions/40313633/how-to-copy-files-from-local-machine-to-docker-container-on-windows
# docker ps --format "{{.Names}}"
docker cp C:\_koray\temp\nvidia\seg_weights semseg:/home/koray/assets


git clone https://github.com/korhun/semantic-segmentation.git
cd semantic-segmentation
python -m runx.runx scripts/eval_cityscapes.yml -i