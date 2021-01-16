nasm src/bootloader.asm -f bin -o impl/bootloader.bin
nasm src/kern.asm -f bin -o impl/kern.bin
cat impl/bootloader.bin impl/kern.bin > impl/bootloader.flp
