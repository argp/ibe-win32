# ibe-win32 - a Win32 port of the Stanford IBE library

## Introduction

This is a collection of the files that I modified in order to get the
[Stanford IBE library](http://crypto.stanford.edu/ibe/) version 0.7.2
to compile on Windows 32 with the MSVC++ development tools.  Please
note that IBE depends on the OpenSSL library and on the GMP library.
I have only tested it on a Windows XP machine.

## Compilation and installation

In order to compile the Stanford IBE library for Windows 32 you need first
to install the [OpenSSL library](http://www.openssl.org/) and
[my Windows port of the GMP library](https://github.com/argp/gmp-win32).

After you have compiled and installed the above required libraries, copy the
files provided here to the distribution directory of IBE 0.7.2 and overwrite
the existing files there, then simply enter the directory and type nmake.
You probably need to change the include directories in the Makefile, unless
you use the directory structure that I do.  There is no installation required,
just put `byte_string.h`, `curve.h`, `fp2.h` and `ibe_lib.h` to your include
path and `ibe.lib` to your library path.  When you are using it in MSVC++ to
compile new programs don't forget to define `_NTRG_WIN32_`, include `ibe_lib.h`
and link against all the required libraries.

In the directory `bin/` you can find a pre-compiled version.

## Acknowledgements

Benjamin Lynn, for implementing the Boneh-Franklin identity-based
encryption scheme.
