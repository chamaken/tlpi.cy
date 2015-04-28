from posix.time cimport itimerspec

cdef extern from "tlpi_hdr.h" nogil:
    # get_num.h
    enum:
        GN_NONNEG
        GN_GT_0
        GN_ANY_BASE
        GN_BASE_8
        GN_BASE_16

    long getLong(const char *arg, int flags, const char *name)
    int getInt(const char *arg, int flags, const char *name)

    # error_functions.h
    void errMsg(const char *format, ...)
    void errExit(const char *format, ...)
    void err_exit(const char *format, ...)
    void errExitEN(int errnum, const char *format, ...)
    void fatal(const char *format, ...)
    void usageErr(const char *format, ...)
    void cmdLineErr(const char *format, ...)

    # itimerspec_from_str.h
    void itimerspecFromStr(char *str, itimerspec *tsp)
