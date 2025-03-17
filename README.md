#  ssd_fuse
A FUSE-based SSD file system for efficient write operations and garbage collection

## Introduction
`ssd_fuse` is a **FUSE-based file system** designed for managing NAND flash storage efficiently. It implements custom read/write operations, garbage collection, and wear leveling strategies to **optimize write performance and minimize Write Amplification Factor (WAF)**.

This project is useful for **flash-based storage systems**, embedded devices, and research on file system optimizations.

## Features
-  **FUSE-based Implementation** – Easily mounts as a user-space file system.
-  **Custom Write Algorithm** – Handles both aligned and unaligned writes.
-  **Garbage Collection** – Implements basic wear-leveling techniques.
-  **Efficient Memory Management** – Reduces excessive writes to enhance SSD lifespan.

##  Installation
### Prerequisites
Ensure you have the following dependencies installed:
- **Linux** (Ubuntu recommended)
- **FUSE** (Filesystem in Userspace)
- **GCC** (GNU Compiler Collection)
- **Make** (Build automation tool)

To install the required dependencies on Ubuntu, run:
```bash
sudo apt update
sudo apt install fuse libfuse-dev build-essential
```

## Build and Run
### Step 1: Clone the Repository
```bash
git clone https://github.com/Unlucky910508/SSD-fuse.git
cd SSD-fuse
```

### Step 2: Compile the Project
Use the provided Makefile to compile the code:
```bash
apt-cache search fuse
sudo apt-get update
sudo apt-get install fuse3
sudo apt-get install libfuse3-dev
reboot
```
Modify NAND_LOCATION to file location
![image](https://github.com/user-attachments/assets/60410dc4-a129-4476-b530-5f5dd2fd4a99)

Compile ssd_fuse.c/ssd_fuse_dut.c

```bash
#gcc –Wall ssd_fuse.c `pkg-config fuse3 --cflags –-libs` -D_FILE_OFFSET_BITS=64 –ossd_fuse
#gcc –Wall ssd_fuse_dut.c –o ssd_fuse_dut
make
```
### Step 3: Mount the File System
Create a mount point and mount `ssd_fuse`:
```bash
mkdir /tmp/ssd
./ssd_fuse -d /tmp/ssd
```

### Step 4: Perform File Operations
write to the nand flash
```bash
echo "hello world" > tmp/ssd/ssd_file
```
We can get this info by DUT
```bash
• #./ssd_fuse_dut /tmp/ssd/ssd_file l
• Return logical size
• #./ssd_fuse_dut /tmp/ssd/ssd_file p
• Return physical size (512B unit)
```

## Configuration Options
You can modify the behavior of the SSD FUSE system by changing parameters in `ssd_fuse.h`:
- **BLOCK_SIZE** – Default: `512 bytes`
- **TOTAL_BLOCKS** – Default: `2048`
- **WEAR_LEVELING_ENABLED** – Enable (`1`) or Disable (`0`) wear leveling

##  Contact
For any questions or suggestions, feel free to reach out:
 Email: lucky910508@gmail.com  
 GitHub Issues: [Open an issue](https://github.com/Unlucky910508/SSD-fuse/issues)
