"""
Try to import cv2.
If that fails, run a bash script to install OpenCV.

Note: This script works for both Python2 and Python3, and the install_opencv.sh
script installs OpenCV for both.
"""
import subprocess

try:
	import cv2
except:
	subprocess.call("install_opencv.sh", shell=True)
else:
	print("OpenCV already installed")
