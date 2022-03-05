## Description
bluerov development platform for marine mechatronics class for master-mir program

## Instructions

### setup container using
copy past the commands onto a terminal from your pc or to the mir room pc
```
docker pull gshubham96/bluerov_dev
git clone git@github.com:gshubham96/bluerov_dev.git
cd bluerov_dev
tar -zxvf volume.tar.gz
docker run -it --rm --name marine_mech -v $(pwd)/volume:/home/ubuntu/Desktop -p 6080:80 --shm-size=512m gshubham96/bluerov_dev
```

### access container using 
```
docker exec -it marine_mech /bin/bash
```

### access gui using
browse: http://127.0.0.1:6080/# bluerov_dev

