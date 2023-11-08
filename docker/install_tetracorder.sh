#!/bin/bash
source /etc/bash.bashrc

#First download davinci software
wget "http://software.mars.asu.edu/davinci/davinci_2.27-1_amd64_ubuntu20_04.deb"
#install it
dpkg -i davinci_2.27-1_amd64_ubuntu20_04.deb

# After installing all the packages, AAAA-README-1st.txt instructs to
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
cp -r /root/spectroscopy-tetracorder/sl1/* /sl1/

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
#single_multmap.h has block B uncommented and cube_multmap.h has block A uncommented and the rest commented out.
#The rest of the contents as same as multmap.h
(cd /src/local/tetracorder5.27 && \
     cp /root/spectroscopy-tetracorder/tetracorder5.27/single_multmap.h multmap.h && \
     make installsingle 2>&1 |  tee make.1.single.out.txt)
(cd /src/local/tetracorder5.27 && \
     cp /root/spectroscopy-tetracorder/tetracorder5.27/cube_multmap.h multmap.h && \
     make install |& tee make.1.cube.out.txt)

#use env -S for finding davinci
(cd /root/tetracorder/t1/tetracorder.cmds/tetracorder5.27c.cmds/ && \
     cp -a cmds.color.support-env-s/* cmds.color.support && \
     cp -a cmds.all.support-env-s/*  cmds.all.support && \
     cp -a davinci-cmds.for.usr.local.bin-env-s/*  /usr/local/bin)

#sample command to run tetracorder for cuprite dataset
#/t1/tetracorder.cmds/tetracorder5.27c.cmds/cmd-setup-tetrun mapping1 aviris_1995 cube ../cuprite.95.cal.rtgc.intel-sml.v 0.00005 -T 0 40 C -p 0.9 1.1 bar
#grep -rl '/usr/local/bin/davinci' | xargs sed -i 's/\/usr\/local\/bin\/davinci/\/usr\/bin\/davinci/g'

