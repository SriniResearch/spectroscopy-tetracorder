The instructions in this file are not complete. These are just snippets to remind me what I did. I will work on making it complete sometime later. 

## Setup and Install
Create a tetracorder folder and clone this repository into spectroscopy-tetracorder folder. 

- Create the tetracorder image
``` 
cd spectroscopy-tetracorder/docker; docker build .
```

- Instantiate the docker container along with mounting a couple of directories. Running this command should create the container and log you in. 
```
sh run.sh
```

- Install tetracorder by running the install_tetracorder.sh script in /root/ folder from within the container. 
```
cd /root/; bash install_tetracorder.sh
```
This command should download and install davinci and tetracorder. The `install_tetracorder.sh` script and `executed_fine.sh` script looks very similar. However the former does not have the complete instructions to build tetracorder. The later seems to have all the instructions but is missing the step to install davinci. Perhaps try the `install_tetracorder.sh` script first and if it fails try the next one.  

## Run Tetracorder
- The following is the syntax to run tetracorder
```
/t1/tetracorder.cmds/tetracorder5.27c.cmds/cmd-setup-tetrun sub_directory   data_set  singlespectrum follow|nofollow  [-t|-T|t|T mintemperature maxtemperature tempuniT] [-p|-P|p|P minpressure maxpressure pressure-unit]  [autostart]
```

- To run tetracorder on the aviris cube
```
/t1/tetracorder.cmds/tetracorder5.27c.cmds/cmd-setup-tetrun mapping4 aviris_1995 cube ../cuprite.95.cal.rtgc.v 0.00005 -t 0 40 C -p 0.9 1.1 bar 
```

- To run tetracorder and generate the results
```
cd mapping4
./cmd.runtet cube ../cuprite.95.cal.rtgc.v band 20 gif >& cmd.runtet.out
```

- Check cmd.runtet.out and tetracorder.out file for errors if you suspect that something did not go well. Typically atleast one core will be engaged for a couple of minutes after you issue the previous command (for tetracoder to run). 

- This docker image should also have tmux installed on it. If you are already on a tmux session, press `ctrl+b+b` to send the commands to the tetracorder tmux session. 

- To convert BSQ to BIL format using Davinci
```
a=read(filename='bsqcubename')
a=bil(a)
write(a,filename='bilcubename.v',type=vicar)
```
