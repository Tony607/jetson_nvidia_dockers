# Jetson Nvidia dockers
Tutorial - [How to run Keras model on Jetson Nano in Nvidia Docker container](https://www.dlology.com/blog/how-to-run-keras-model-on-jetson-nano-in-nvidia-docker-container/)

In Jetson Nano command line, pull the Docker container from Docker Hub like this.
```
docker pull docker.io/zcw607/jetson:r1.0.1
```
Then start the container with the following command.
```
docker run --runtime nvidia --network host -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix zcw607/jetson:r1.0.1
```
Check TensorFlow GPU is installed, type `python3` in the command then,
```python
from tensorflow.python.client import device_lib
device_lib.list_local_devices()
```
If everything works, it should print
![](https://gitcdn.xyz/cdn/Tony607/blog_statics/a5f860d17b122866708e54f897363db1bed503f9/images/jetson/tf_gpu.png)

*Read the [tutorial](https://www.dlology.com/blog/how-to-run-keras-model-on-jetson-nano-in-nvidia-docker-container/) for more instructions.*