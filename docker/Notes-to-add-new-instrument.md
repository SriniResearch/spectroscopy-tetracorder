**Note: These are snippets to remind me the steps I followed to add a new device to tetracorder. They are by no means complete**

To view the markdown file: pandoc -s Notes.md | lynx -stdin

To modify the tetracoder image, edit the Dockerfile

To build the image use the command
```
docker build -t tetracorder .
```

To create an container, mount a local directory and connect to the container use the command
```
mkdir data
docker run -it  -v `pwd`/data:/root/tetracorder/data  --name tetracorder tetracorder /bin/bash
```


## Instructions to add a new instrument
To add a new instrument:

1) convolve the spectral libraries.

2) cd DATASETS
   copy an existing entry to the new name.
   edit the new file
   example:  cp aviris_2018 emit-a
             vi emit_a     # result:
             data=    EMIT-2022
             restart= r1-emita

3) add an entry for the new instrument in DELETED.channels
   cd DELETED.channels
   add new file or edit DELETED.channels.txt.
   Example new file:
   delete_emit_a
    c   # emit_a   (no deleted points at this time)

4) copy a restart file to the new instrument name and edit the spectral library names.
     example, for  restart_files/r1-emita, change the lines:
                   (get the number of channels from the target spectrometer)
        cp restart_files/r1-av18a  restart_files/r1_emita
        edit  restart_files/r1_emita   and change the follor to:
        iwfl=/sl1/usgs/rlib06/r06emita  
        iyfl=/sl1/usgs/library06.conv/s06emita #s06vae1a
        irfl=r1-r06emita
        #
        iwdgt=      r06emita  # file device letter w
        inmy=       s06emita  # file device letter y #s06vae1a
        nchans=          288  # num wave chans #97



## Convolve spectral library
The instructions to convolve spectral library for a new instrument is in /sl1/usgs/library06.conv/AAAAAA.README.txt which inturn points to AAAA.README-add-new-instrument-library.txt for adding a new instrument.
It asks us to run this script ./AAA.make.new.instrument.convolved.spectral.library.sh

Create wavelengths file which is a text file with every line specifying the wavelength in microns and FWHM file which is again a text file with every line specifying the gap between the wavelengths in microns.

Executed the following command: (TODO: Not sure what the fwhm_record_number (I set it to 24 here) should be)
fwhm_record_number should be 12 for the resolution, full width half max (what ever that means)

Set the SPECPR environment variable to `/src/local/specpr` ???
export SPECPR=/src/local/specpr
export SP_LOCAL=/usr/local
export SP_BIN=bin

```
./AAA.make.new.instrument.convolved.spectral.library.sh s06vae1 a 97 VAE 12 'Convolved VAE 97 ch library' 'Wavelengths in microns ' 'Resolution in microns' -waves ~/current/aviris_97_wavelengths.txt -fwhm ~/current/aviris_97_FWHM.txt noX  
```
This script essential runs the following commands:
```
./make.new.convol.library.start.file  s06vae1a  97  "Convolved VAE 97 ch library"  "Wavelengths in microns"  "Resolution in microns" force 
spsetwave startfiles/s06vae1a.start   6  6  12  force
spsetwave startfiles/s06vae1a.start  12  6  12  force
spsetwave startfiles/s06vae1a.start  18  6  12  force 
spprint   startfiles/s06vae1a.start
./mak.convol.library s06vae1 a 97  VAE  12 noX 
```

Creates
`conv.s06vae1a.cmds` and `s06vae1a` files in `/sl1/usgs/library06.conv`

### Convolve the research library

#### Automatic 
```
cd /sl1/usgs/rlib06
./make.copy.and.change.s06-start-to-r06-start  s06vae1a  r06vae1a
```
This script seems to just copy AVIRIS with 224 channels and not the new instrument

#### Manual 
Copy the start file and change the title
```
cp /sl1/usgs/library06.conv/startfiles/s06an14b.start startfiles/r06an14b.start  
spsettitle startfiles/r06an14b.start 1 "USGS Digital Spectral Library: r06an14b "
```

To display specpr file use `spprint file`

After the restart files are created run this command to convolve the spectra
mak.convol.library r06vae1 a 97 VAE 12 noX
