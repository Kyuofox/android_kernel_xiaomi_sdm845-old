rm -rf out
export PATH=/data/clang/bin:${PATH}
make O=out ARCH=arm64 polaris_defconfig
make -j$(nproc --all) O=out \ARCH=arm64 \CC=/data/clang/bin/clang \
	CROSS_COMPILE=/data/clang/bin/aarch64-linux-gnu- \
	CROSS_COMPILE_ARM32=/data/clang/bin/arm-linux-gnueabi- \
	LD=/data/clang/bin/ld.lld \
	OBJCOPY=/data/clang/bin/llvm-objcopy \
	OBJDUMP=/data/clang/bin/llvm-objdump \
	STRIP=/data/clang/bin/llvm-strip \
	NM=/data/clang/bin/llvm-nm \
	AR=/data/clang/bin/llvm-ar | tee kernel.log
