#! /bin/bash

# get ubuntu dependencies
apt-get -y install python3-pip git libgdal-dev python3-gdal libspatialindex-dev wget libgfortran3 imagemagick file

# set Snap and OTB version and download link
OTB_VERSION="7.3.0"
TBX_VERSION="8"
TBX_SUBVERSION="0"
SNAP_URL="http://step.esa.int/downloads/${TBX_VERSION}.${TBX_SUBVERSION}/installers"
TBX="esa-snap_sentinel_unix_${TBX_VERSION}_${TBX_SUBVERSION}.sh"

# get Snap
wget "${SNAP_URL}/${TBX}"
chmod 755 ${TBX}
wget https://raw.githubusercontent.com/EOX-A/OpenSarToolkit/master/snap.varfile

# install snap
./${TBX} -q -varfile snap.varfile
rm ${TBX}

# OTB installation
OTB=OTB-${OTB_VERSION}-Linux64.run
wget https://www.orfeo-toolbox.org/packages/${OTB}
chmod +x $OTB
./${OTB}
rm -f ${OTB}

# install ost
pip install git+https://github.com/EOX-A/OpenSarToolkit