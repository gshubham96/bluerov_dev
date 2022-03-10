# Build the image using `docker build ./ -t gshubham96/bluerov_dev`
# or `docker build ./ --build-arg user=<your-username> --build-arg pass=<your-password> -t gshubham96/bluerov_dev`
# Run using `docker run --rm -it -p 127.0.0.3:7080:7080 gshubham96/bluerov_dev`
# Run using 'docker run --rm -it -p 127.0.0.3:7080:7080 -v $(pwd)\medusa:\root gshubham96/bluerov_dev'

# '####################################################'
# ' O_dot_o                                 '
# ' Last version date: 09/03/2022                      '
# ' Supports: Ubuntu 18.04LTS                          '
# '                                                    '
# ' Installation script by:                            '
# '    @name: Shubham Garg                             '
# '    @email: gshubham96@gmail.com                    '
# '                                                    '
# ' Updated by:                                        '  
# '                                                    '
# ' Based on the previous scripts from:                '
# '                                                    '
# ' Tested by:                                         '
# '                                                    '
# '####################################################'


######################################
# -> Code Starts Below
######################################

# ---------------------
# -> Start with Base Image of Ubuntu+ROS+VNC.
# ------------------------
FROM tiryoh/ros-desktop-vnc:melodic

# ---------------------
# -> Dockerfile takes in arguement of user's username and password to build the image
# ------------------------
# ARG user
# ARG pass

# ---------------------
# -> Add a volume '/root' to install the stack in
# TODO: Check if there is a better way of doing this
# ------------------------
RUN mkdir -p root/ fallback/

# ---------------------
# -> Update the base image
# ------------------------
RUN apt update && \
    apt install -y redis-server && \
    apt clean
RUN apt upgrade -y

# ---------------------
# -> Install basic programs that medusa install script expects docker to have
# ------------------------
RUN apt install sudo iputils-ping expect git -y
RUN apt install ros-melodic-desktop-full

# ---------------------
# -> Install the Python requirements 
# ------------------------
RUN apt install python3-pip -y
RUN pip3 install --user numpy pandas matplotlib scipy sklearn rospkg catkin_pkg future joystick-controller

# ---------------------
# -> Install C++ (apt-get) requirements
# ------------------------
RUN apt-get install cmake python-catkin-pkg python-empy python-nose python-setuptools libgtest-dev build-essential openssh-server -y
RUN apt-get install python-wstool python-rosinstall-generator python-catkin-tools -y
RUN apt-get install python3-catkin-tools libgeographic-dev ros-melodic-geographic-msgs ros-melodic-geodesy -y
RUN apt-get install ros-melodic-joy* -y

# ---------------------
# -> Create the Catkin Space
# ------------------------
WORKDIR /home/ubuntu
RUN mkdir catkin_ws
RUN mkdir catkin_ws/src

# ---------------------
# -> Clone the git repo
# ------------------------
WORKDIR /home/ubuntu/catkin_ws/src
COPY autonomous_rov.tgz ./
RUN tar -zxvf autonomous_rov.tgz
RUN rm autonomous_rov.tgz

# ---------------------
# -> Compile time
# ------------------------
WORKDIR /home/ubuntu/catkin_ws/
RUN catkin init
# RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; catkin build'
# RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; catkin build -j1 -v'

# ---------------------
# -> Copy contents of /root to /fallback.
# Why? In case user wants persistent data, user needs to create and specify their own docker volume. But, this volume needs to be specified during runtime.
# ------------------------
WORKDIR /
RUN cp -r /home fallback/
# RUN rm -r /fallback/home/ubuntu/catkin_ws/devel/ /fallback/home/ubuntu/catkin_ws/build/ /fallback/home/ubuntu/catkin_ws/logs/

# ---------------------
# -> Copy contents of /fallback to /root if /root is empty (new volume)
# Why? In case user wants persistent data, user needs to create and specify their own docker volume. But, this volume needs to be specified during runtime.
# ------------------------
WORKDIR /home/ubuntu/
ENTRYPOINT { A=$(ls /home) && [ "$A" ]; } && { echo "Launching Bluerov Container, Have Fun! :)"; } || { echo "Volume is empty, coying bluerov-stack onto volume! :)" && cp -r /fallback/ /home/ && mv /home/fallback/* /home/ && rm -r /home/fallback; } && /bin/bash

######################################
# -> All done, enjoy!
######################################
