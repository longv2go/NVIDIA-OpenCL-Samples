#!/bin/bash

# 遍历 ocl* 目录，执行 make

function make_ocl() {
    for dir in `ls | grep ocl`; do
        action=$1
        if [ -z $action ]; then
            action=build
        fi
        echo ""
        echo -e "\033[32mStarting ${action} [${dir}] \033[0m"
        cd $dir/"NVIDIA GPU Computing SDK"/OpenCL
        make $1
        if [ $? -ne 0 ]; then
            echo -e "\033[31m${action} [${dir}] failed!\033[0m"
            exit 1
        fi
        cd -
    done
}

echo $1

if [ "$1" == "clean" ]; then
    make_ocl clean
else
    make_ocl
fi
