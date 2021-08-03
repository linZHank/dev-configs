# Install TensorFlow 2 
Following was performed and tested in Ubuntu 20.04
### Install Pre-requisites (CUDA, libcudnn)
Refer to official [GPU guide](https://www.tensorflow.org/install/gpu)
```bash
# Add NVIDIA package repositories
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt update

wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb

sudo apt install ./nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb
sudo apt update

wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/libnccl2_2.8.3-1+cuda11.2_amd64.deb
sudo apt install ./libnccl2_2.8.3-1+cuda11.2_amd64.deb
sudo apt update

# Install development and runtime libraries (~4GB)
sudo apt install --no-install-recommends cuda-11-0 libcudnn8 libcudnn8-dev

# Reboot. Check that GPUs are visible using the command: nvidia-smi

# Install TensorRT. Requires that libcudnn8 is installed above.
sudo apt install -y --no-install-recommends libnvinfer8 libnvinfer-dev libnvinfer-plugin8
```

### Install TensorFlow with Pip
Refer to official [pip installation guide](https://www.tensorflow.org/install/pip)
```bash
sudo apt update
sudo apt install python3-dev python3-pip
pip install pip --upgrade
pip install tensorflow

# Verify installation
python -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
```
