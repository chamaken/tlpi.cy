from libc.stdio cimport perror, printf
from libc.stdlib cimport exit, EXIT_SUCCESS

cdef extern from "string.h" nogil:
       size_t strlen(const char *s)

cdef extern from "pthread.h" nogil:
    ctypedef struct pthread_t:
        pass
    ctypedef struct pthread_attr_t:
        pass

    int pthread_create(pthread_t *thread, const pthread_attr_t *attr,
                       void *(*start_routine) (void *), void *arg)
    int pthread_join(pthread_t thread, void **retval)

cimport tlpi


cdef void *threadFunc(void *arg) nogil:
    cdef char *s = <char *> arg

    printf("%s", s)

    return <void *> strlen(s)


cdef int main(int argc, char *argv[]) nogil:
    cdef pthread_t t1
    cdef void *res
    cdef int s

    s = pthread_create(&t1, NULL, threadFunc, "Hello world\n")
    if s != 0:
        tlpi.errExitEN(s, "pthread_create")

    printf("Message from main()\n")
    s = pthread_join(t1, &res)
    if s != 0:
        tlpi.errExitEN(s, "pthread_join")

    printf("Thread returned %ld\n", <long> res)

    exit(EXIT_SUCCESS)


cdef extern from "alloca.h" nogil:
    void *alloca(size_t size);

import sys
cdef int argc = len(sys.argv)
cdef char **argv = <char **>alloca(sizeof(char *) * argc)
for i, s in enumerate(sys.argv):
    argv[i] = s
if __name__ == "__main__":
    with nogil:
        main(argc, argv)
