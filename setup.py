from setuptools import setup

setup(
    name='tlpi',
    version='0.1',
    description='play The Linux Programming Interface with cython',
    author='Ken-ichirou MATSUZAWA',
    author_email='chamas@h4.dion.ne.jp',
    url='https://github.com/chamaken/tlpy.cy',
    packages=['tlpi',],
    classifiers=['License :: OSI Approved :: GNU Lesser General ' +
                 'Public License v3 or later (LGPLv3)',
                 'Programming Language :: Cython',
                 'Topic :: Software Development :: Libraries :: ' +
                 'Cython pxd declarations',
                 'Operating System :: Linux',
                 'Intended Audience :: Education',
                 'Development Status :: 2 - Pre-Alpha'],
    data_files=[('.', ['tlpi/tlpi.pxd',]),],
)
