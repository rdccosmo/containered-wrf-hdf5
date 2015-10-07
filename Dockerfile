FROM rdccosmo/wrfbase
RUN wget http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src/szip-2.1.tar.gz && \
    tar zxvf szip-2.1.tar.gz && \
    rm -f szip-2.1.tar.gz && \
    cd szip-2.1 && ./configure --prefix=$PREFIX && \
    make && make install && cd ..

RUN wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/zlib-1.2.7.tar.gz && \
    tar xzvf zlib-1.2.7.tar.gz && \
    rm -f zlib-1.2.7.tar.gz && \
    cd zlib-1.2.7 && \
    ./configure --prefix=$PREFIX && \
    make && \
    make install && cd ..

RUN wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.15-patch1.tar.bz2 && \
    tar jxvf hdf5-1.8.15-patch1.tar.bz2 && \
    rm -f hdf5-1.8.15-patch1.tar.bz2 && \
    cd hdf5-1.8.15-patch1 && \
    ./configure \
        --prefix=$PREFIX \
        --with-zlib=$PREFIX \
        --with-szip=$PREFIX \
        --enable-fortran \
        --enable-cxx && \
    make && \
    make install
