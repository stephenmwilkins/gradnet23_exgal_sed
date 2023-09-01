


# set up python virtual environment
python -m venv venv

# activate python virtual environment
source venv/bin/activate

# clone synthesizer
git clone -b gradnet23 --single-branch https://github.com/flaresimulations/synthesizer.git

# install synthesizer in this virtual environment
pip install -e synthesizer/

# install corner for making corner plots
pip install corner

# synthesizer should now be installed and the two synthesizer notebooks should
# work in addition there are a set of example notebooks included in the 
# synthesizer repo in docs/source.

# next we're going to install bagpipes. To do this we first need to install 
# PyMultiNest. To install MultiNest see point 1 of the “on your own computer” 
# section of the PyMultiNest installation instructions:
# http://johannesbuchner.github.io/pymultinest-tutorial/install.html


# to install PyMultiNest on a mac first we need gcc and cmake which require
# we have Homebrew installed. Once Homebrew is installed we can do:
brew install gcc
brew install cmake

# then we can clone and build MultiNest:
git clone https://github.com/JohannesBuchner/MultiNest
cd MultiNest/build
cmake ..
make
sudo make install
cd ../..
rm -r MultiNest

# and install bagpipes
pip install bagpipes

# copy of the NIRCam filters to the bagpipes installation
cp filters/* venv/lib/python3.10/site-packages/bagpipes/filters/

# install wget if its not installed
# brew install wget

# download the bc03 synthesizer grid. This should be similar to that used by bagpipes
mkdir grids
wget -O cb07.hdf5  https://www.dropbox.com/scl/fi/w8hrnbmjw67f0xaqzqgei/bc03-2016-Miles_chabrier03-0.1-100_cloudy-c17.03.hdf5?rlkey=iqh1vqmuftrg02b1mmrk0ywcn&dl=1 
