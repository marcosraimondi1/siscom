#!/sbin/bash

if [ ! -d "./build" ]; then
	mkdir ./build
fi

# compile with profiling info
gcc -Wall -pg test_gprof.c test_gprof_new.c -o ./build/test_gprof

cd build
./test_gprof

# run profiler
gprof ./test_gprof gmon.out > profile.txt

# create image
cat profile.txt | gprof2dot | dot -Tpng -o profile.png

# compile with debugging information
gcc -Wall -g test_gprof.c test_gprof_new.c -o ./build/test_gprof

# run perf profiler
perf record -g -- /path/to/your/executable

# create image
perf script | c++filt | gprof2dot.py -f perf | dot -Tpng -o output.png
