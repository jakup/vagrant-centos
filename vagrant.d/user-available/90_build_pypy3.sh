# NOTE: increase the memory available to the VM to at least 4GB in the Vagrantfile
# building pypy3 requires a lot of memory

PYPY3_VER="pypy3-v6.0.0"
LATEST_PYPY2_PORTABLE="pypy-6.0.0-linux_x86_64-portable"

# Install pypy in /opt/pypy
curl -L "https://bitbucket.org/squeaky/portable-pypy/downloads/${LATEST_PYPY2_PORTABLE}.tar.bz2" \
    | sudo tar -C /opt -xjvf -
sudo ln -s /opt/${LATEST_PYPY2_PORTABLE} /opt/pypy

# Build dependencies
sudo yum -y install gcc make pkgconfig libffi-devel zlib-devel bzip2-devel expat-devel openssl-devel lib unwind-devel sqlite-devel ncurses-devel gdbm-devel tk-devel xz-devel

# Get pypy3 source
curl -L "https://bitbucket.org/pypy/pypy/downloads/${PYPY3_VER}-src.tar.bz2" | tar -xjvf -

# Build pypy3
cd "${PYPY3_VER}-src/pypy/goal"
/opy/pypy/bin/pypy ../../rpython/bin/rpython --opt=jit
PYTHONPATH=../../ ./pypy3-c ../tool/build_cffi_imports.py

# Make release archive
cd ../tool/release
./package.py --archive-name=${PYPY3_VER}-linux_x86_64-centos7

# Copy build to shared directory
cp -r /tmp/usession-release-pypy3.5-v6.0.0-1/build /mnt/shared
