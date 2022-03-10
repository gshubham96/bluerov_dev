# bluerov_dev

## Description
bluerov development platform for marine mechatronics class for master-mir program - 

## Instructions

### Setup the container using
copy paste the commands below onto a terminal from your pc or to the mir room pc

1. Download the image from Docker Hub
```
docker pull gshubham96/bluerov_dev
```
2. Clone this repo where you want to store the data. 
```
git clone https://github.com/gshubham96/bluerov_dev.git && cd bluerov_dev
```
3. Extract the volume folder
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

### To install an IDE on linux on MIR room PC

**get portable vs code from here**
1. Download the 64-bit .tar.gz from https://code.visualstudio.com/download#

**install this extenstion for docker access**
1. Go here and click the "Download Extension" button. https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
2. In VS Code, press "F1" and search for "Install from VSIX" and select the above downloaded file
3. After installation, press "F1" and search for "Attach to Running Container" to connect docker and VS-Code for easy development. ^_^
4. enjoy life with a good beer/cola.


