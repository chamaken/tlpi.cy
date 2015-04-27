tlpi.cy
========

Playing The Linux Programming Interface sample code with Cython.

installation
------------

get the sample code from http://man7.org/tlpi/code/ and backup Makefile in lib. 
copy this lib/Makefile to sample code's lib dir and create libtlpi.so.1.0.0. 
by ``make shared''. copy libtlpi.so.1.0.0 to /usr/local/lib and run ldconfig. 

then change INCDIR in Makefile.inc to tlpi-dist/lib and:

    $ python setup.py install
    $ cd threads
    $ make
    $ ./simple_thread

requires
--------

* [The Linux Programming interface sample source code](http://man7.org/tlpi/code/)
* Cython >= 0.19 ? (debian wheezy)
