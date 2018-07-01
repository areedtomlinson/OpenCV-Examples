
## Setup

### Prerequisites
Install Virtualbox and Vagrant.
Run `vagrant plugin install vagrant-disksize`

### Setup
Run `vagrant up`
That's it! You can now access the Vagrant box with `vagrant ssh`, or through the forwarded ports (see "Usage" section).

## Usage
To start the iPython notebook server, run `cd /home/vagrant/opencv_examples/Examples` and then:

Python 2: `ipython notebook --no-browser --ip=0.0.0.0`

Python 3: `ipython3 notebook --no-browser --ip=0.0.0.0`

Now on local, you can open `127.0.0.1:8888` in your browser and see the notebook browser.

