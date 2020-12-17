#!/bin/bash

# 遍历 ocl* 目录，执行 make

function make_all() {
    for dir in `ls | grep ocl`; do
        make_sample $1 $dir
    done
}

function make_sample() {
    action=$1
    sample_dir=$2
    target=""

    if [ $action == "clean" ]; then
        target="clean"
    fi

    echo ""
    echo -e "\033[32mStarting ${action} [${sample_dir}] \033[0m"
    cd $sample_dir/"NVIDIA GPU Computing SDK"/OpenCL
    make $target
    if [ $? -ne 0 ]; then
        echo -e "\033[31m${action} [${sample_dir}] failed!\033[0m"
        exit 1
    fi
    cd -
}

function usage() {
    echo "usage: build|clean [DIR]"
}

if [ $1 == "-h" ]; then
    usage
    exit 0
fi

if [ $# -le 1 ]; then
    if [ "$1" == "clean" ]; then
        make_all clean
    else
        make_all build
    fi
fi

if [ $# = 2 ]; then
    if [ "$1" == "clean" ]; then
        make_sample clean $2
    else
        make_sample build $2
    fi
    exit 0
fi

