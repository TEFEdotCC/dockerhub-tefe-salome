#!/bin/bash

cd /opt
curl ${SALOME_URL} -o ${SALOME_FILE_TAR}

# check file
if md5sum -c $SALOME_FILE_MD5; then
  rm -f $SALOME_FILE_MD5
else
  echo "checksum md5 fails"
  exit -1;
fi
if sha512sum -c $SALOME_FILE_SHA512SUM; then
  rm -f $SALOME_FILE_SHA512SUM
else 
  echo "checksum sha512sum fails"
  exit -1;
fi

# install salome
mkdir salome
tar xfz ${SALOME_FILE_TAR} -C /opt/salome --strip-components 1

