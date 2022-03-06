# bluerov_dev

## Description
bluerov development platform for marine mechatronics class for master-mir program - 

## Instructions

### setup the container using
copy paste the commands below onto a terminal from your pc or to the mir room pc

1. Download the image from Docker Hub
```
docker pull gshubham96/bluerov_dev
```
2. Clone this repo where you want to store the data. 
```
git clone https://github.com/gshubham96/bluerov_dev.git && cd bluerov_dev
```
3. Extract the volume to the right folder
```
tar -zxvf volume.tar.gz
```

### Run the Docker container using
1. move to directory where volume was extracted and run this command
```
docker run -it --rm --name marine_mech -v $(pwd)/volume:/home/ubuntu/Desktop -p 6080:80 --shm-size=512m gshubham96/bluerov_dev
```

### Access container using 
```
docker exec -it marine_mech /bin/bash
```

### Access gui using
browse: http://127.0.0.1:6080/


