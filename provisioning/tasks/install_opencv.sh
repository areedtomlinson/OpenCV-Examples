#!/bin/bash

# Based on https://www.pyimagesearch.com/2015/07/20/install-opencv-3-0-and-python-3-4-on-ubuntu/

# Make temporary directory:
mkdir /home/vagrant/opencv_contrib
mkdir /home/vagrant/opencv_contrib/tmp
cd /home/vagrant/opencv_contrib/tmp

# Clone OpenCV repo
git clone https://github.com/Itseez/opencv.git
cd opencv

# Switch to v3.0.0
git reset --hard 3.0.0

# Clone OpenCV Contrib
cd /home/vagrant/opencv_contrib/tmp
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib

# Switch to v3.0.0
git reset --hard 3.0.0

# Build and install
cd /home/vagrant/opencv_contrib/tmp/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON ..
make -j4
sudo make install
sudo ldconfig

sudo mkdir /usr/local/lib/python2.7/site-packages/
sudo mkdir /usr/local/lib/python3.5/site-packages/

sudo cp /usr/local/lib/libopencv_core.so.3.0.0 /usr/local/lib/python2.7/site-packages/cv2.so
sudo cp /usr/local/lib/libopencv_core.so.3.0.0 /usr/local/lib/python3.5/site-packages/cv2.so

# Clean up:
#rm -rf /home/vagrant/opencv_contrib/tmp

