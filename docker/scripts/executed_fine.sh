#!/bin/bash

# After installing all the packages including davinci, AAAA-README-1st.txt instructs to
# follow the instructions in AAAA.README-spectroscopy-setup

#AAA.README-spectroscopy-setup - Step 1 assumes linux is already installed and running.
#AAA.README-spectroscopy-setup - Step 2 recommends to replace rclark with the system username,
# however there isn't any rclark in the script. And then run the os-setup-script

# Run the OS setup script and follow the instructions on it (setup operating system and spectral libraries)
(cd /root/spectroscopy-tetracorder && \
     ./AAA.INSTALL.spectroscopy-os-setup-linux.sh install 2>&1 | tee AAA.INSTALL.spectroscopy-os-setup-linux.sh.out1 )
#change the ownership of t1 and sl1 folders
chown root /t1/ /sl1/ 
    
#AAA.README-spectroscopy-setup - Step 3 - untar the source code and spectral data files
#copy the spectral libraries
cp -r /root/spectroscopy-tetracorder/sl1 /sl1/

#copy the specpr and tetracorder directories into the source directory at /src/local
cp -r /root/spectroscopy-tetracorder/specpr /src/local/ 
cp -r /root/spectroscopy-tetracorder/tetracorder5.27 /src/local/

#copy tetracorder commands directory into /t1
cp -r /root/spectroscopy-tetracorder/tetracorder.cmds  /t1/

#That completes the instructions from AAA.README-spectroscopy-setup. Now jumping back to AAAA-README-1st file
#make symbolic links of the scripts for tetracorder
cp -s /t1/tetracorder.cmds/tetracorder5.27c.cmds/davinci-cmds.for.usr.local.bin/* /usr/local/bin

#copy the bashrc and cshrc files from the main tetracorder repository which sets the SPECPR env variable which
# is necessary in the next step as the default bashrc file in /etc does not have this variable
cp /root/spectroscopy-tetracorder/etc/* /etc/
#and source that
source /etc/bash.bashrc

#Make specpr 
(cd /src/local/specpr && \
     mkdir -p /src/local/specpr/lib/ && \
     mkdir -p /src/local/specpr/obj/ && \
     ./AAA.INSTALL.specpr+support-progs-linux-upgrade.1.7.sh 2>&1 | tee ./AAA.INSTALL.specpr+support-progs-linux-upgrade.1.7.sh.out.txt )

# and then tetracorder
# To make tetracorder, jump into the AAA.readme.how.to.make.txt file inside the tetracorder5.27 folder
(cd /src/local/tetracorder5.27 && \
     cp /root/spectroscopy-tetracorder/tetracorder5.27/single_multmap.h multmap.h && \
     make installsingle 2>&1 |  tee make.1.single.out.txt && \
     cp /root/spectroscopy-tetracorder/tetracorder5.27/cube_multmap.h multmap.h && \
     make install |& tee make.1.cube.out.txt)
     
     
# TODO: Setup vim syntax highlighting for Davinci
#cd /t1/tetracorder.cmds/tetracorder5.26e.cmds/vim/ and follow the AAA.readme.txt



INSTALL_DIR=/root/install-files



# Extract and install tetracorder
(mkdir -p ~/tetracorder && \
    mkdir -p ~/tetracorder/src/local && \
    tar -xf ${INSTALL_DIR}/tetracorder5.27_2022-09-22-clean.tar.gz -C ~/tetracorder/src/local && \
    mkdir -p ~/tetracorder/t1/tetracorder.cmds && \
    tar -xf ${INSTALL_DIR}/tetracorder5.27b.cmds-2022-10-13.tar.gz -C ~/tetracorder/t1/tetracorder.cmds && \
    mkdir -p ~/tetracorder/src/local/specpr && \
    cp -R ~/spectroscopy-tetracorder/specpr ~/tetracorder/src/local/ && \
    mkdir -p ~/tetracorder/sl1/usgs/rlib06 && \
    tar -xf ${INSTALL_DIR}/rlib06-update.tar.gz -C ~/tetracorder/sl1/usgs/rlib06 && \
    mkdir -p ~/tetracorder/sl1/usgs/library06.conv && \
    tar -xf ${INSTALL_DIR}/library06.conv-update-2022-10-13.tar.gz -C ~/tetracorder/sl1/usgs/library06.conv && \
    mkdir -p ~/tetracorder/src/local/bin)
    
# Change permissions
cd ~/tetracorder && \
     chmod -R 777 sl1 src t1 * #&& \
#     chmod -R 777 d1 p1 sl1 src t1 *

# Recompile specpr
(cd ~/tetracorder/src/local/specpr/ && \
    ./AAA.INSTALL.specpr+support-progs-linux-upgrade.1.7.sh | tee AAA.INSTALL.specpr+support-progs-linux-upgrade.1.7.sh.out1)

#  Volume configuration
#VOLUME ["~/tetracorder"]

# Copy start.sh script and




