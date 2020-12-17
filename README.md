# NVIDIA-OpenCL-Samples
 可编译的 nvidia opencl 官方示例代码，https://developer.nvidia.com/opencl


# 编译

ocl* 子目录结构基本一致，为了编译，做了如下变更

* 在 shared 目录下增加 Makefile，各个目录对应的文件内容一致
* 修复 shared/inc/cmd_arg_reader.h 的编译错误，各个目录对应的文件内容一致
* common_opencl.mk 修改库搜索路径，为了可以找到 OpenCL 库，各个目录对应的文件内容一致
* 如果有依赖 -lGLEW_x86_64 的修改为 -lGLEW

如果本机的 OpenCL 安装路径和上述修改不一致，请修改 common_opencl.mk 的 USRLIBDIR 变量

## oclBandwidthTest
host - device 数据传送带宽测试

## oclSimpleGL
CL and GL 互操作

# 依赖

* cuda
