docker rm tetracorder
docker run -it  \
       -v .:/root/current \
       -v ./data:/root/tetracorder/data \
       -v ./spectroscopy-tetracorder:/root/spectroscopy-tetracorder \
       -v ./scripts:/root/scripts \
       --name tetracorder tetracorder \
       /bin/bash
