# Build the image using `docker build ./ -t gshubham96/bluerov_dev`
# Run using 'docker run --rm -it -v $(pwd)/vol:/home/ubuntu gshubham96/bluerov_dev'

# '####################################################'
# ' gshubham96                                 '
# ' Last version date: 07/02/2022                      '
# ' Supports: Ubuntu 16.04LTS                          '
# '           Ubuntu 18.04LTS                          '
# '           Ubuntu 20.04LTS                          '
# '                                                    '
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
# -> Start with the base Ubuntu Image. 
# TODO: Add tag for Ubuntu version
# ------------------------
FROM tiryoh/ros-desktop-vnc:melodic

# ---------------------
# -> Add a volume '/root' to keep all user directories
# ------------------------
VOLUME /home/ubuntu

# ---------------------
# -> Update the base image
# ------------------------
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get clean -y

# ---------------------
# -> Install basic programs that install script expects docker to have
# ------------------------
RUN apt install sudo -y

# ---------------------
# -> configure time zone
# ------------------------
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ---------------------
# -> setup content needed for marine course
# ------------------------
RUN apt-get install -y cmake python-catkin-pkg python-empy python-nose python-setuptools libgtest-dev build-essential openssh-server
RUN apt-get install python-wstool python-rosinstall-generator python-catkin-tools
WORKDIR /home/ubuntu
RUN mkdir catkin_ws
WORKDIR /home/ubuntu/catkin_ws
RUN mkdir src

######################################
# -> All done, enjoy!
######################################
