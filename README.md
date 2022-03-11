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
3. Extract the volume.zip folder
4. Add the network interface to your PC with the following configs (If you'd like to connect to the BlueROV)
```
static_ip: 192.168.254.20
DNS: 255.255.255.0
gateway_ip: 192.168.254.1
```
5. Create a docker network with the following command
```
docker network create -d macvlan --subnet=192.168.254.0/24 --gateway=192.168.254.1 -o parent=enx00e04c3603d0 net_bluerov
```
`enx00e04c3603d0` is the network driver address. It might be different for you. Find this with the command `lsusb`.

6. To enable VNC, do the following (optional)

**For Linux**
 [https://collabnix.com/2-minutes-to-docker-macvlan-networking-a-beginners-guide/](Reference)
```
sudo ip link add mac0 link <network_driver_addr> type macvlan mode bridge
sudo ip addr add 192.168.254.19/24 dev mac0
sudo ifconfig mac0 up
```
**For MacOS**
instructions coming soon hopefully

**For Windows**
instructions coming soon hopefully

### Run the Docker container using
1. move to directory where volume was extracted and run this command
```
docker run -it --rm --name marine_mech -v $(pwd)/volume:/home/ubuntu/Desktop -p 6080:80 --shm-size=512m --net=net_bluerov --ip=192.168.254.15 gshubham96/bluerov_dev
```

### Access container using 
```
docker exec -it marine_mech /bin/bash
```

### Access gui using
browse: http://192.168.254.15:6080/

### To install an IDE on linux on MIR room PC

**get portable vs code from here**
1. Download the 64-bit .tar.gz from https://code.visualstudio.com/download#

**install this extenstion for docker access**
1. Go here and click the "Download Extension" button. https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
2. In VS Code, press "F1" and search for "Install from VSIX" and select the above downloaded file
3. After installation, press "F1" and search for "Attach to Running Container" to connect docker and VS-Code for easy development. ^_^
4. enjoy life with a good beer/cola.


