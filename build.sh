rm -rf out
export PATH=/home/zclkkk/clang/bin:${PATH}
make O=out ARCH=arm64 Kyuo_dipper_defconfig
make -j$(nproc --all) O=out \ARCH=arm64 \CC=/home/zclkkk/clang/bin/clang \
	CROSS_COMPILE=/home/zclkkk/aarch64-linux-gnu/bin/aarch64-linux-gnu- \
	CROSS_COMPILE_ARM32=/home/zclkkk/arm-linux-gnueabi/bin/arm-linux-gnueabi- \
	LD=/home/zclkkk/clang/bin/ld.lld \
	OBJCOPY=/home/zclkkk/clang/bin/llvm-objcopy \
	NM=/home/zclkkk/clang/bin/llvm-nm \
	AR=/home/zclkkk/clang/bin/llvm-ar | tee kernel.log
