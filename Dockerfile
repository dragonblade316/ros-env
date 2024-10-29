FROM docker.io/ubuntu:noble

#zsh and the add-apt-repo commands
RUN apt-get update && apt-get install -y zsh software-properties-common lsb-release gnupg wget

RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update
RUN apt-get -y install neovim


ENV LANG LANG=en_US.UTF-8

#ROS2 install
RUN add-apt-repository universe
RUN apt-get update && apt-get install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get update
RUN apt-get install -y ros-dev-tools
RUN apt-get install -y ros-jazzy-desktop

RUN apt-get install -y clang

ENV QT_QPA_PLATFORM xcb
ENV GZ_VERSION harmonic
ENV CC clang
ENV CXX clang++

RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN apt-get update
RUN apt-get install -y gz-harmonic 
# RUN apt-get install -y ros-jazzy-ros-gz

RUN mkdir -p /etc/apt/keyrings
RUN wget -q https://cyberbotics.com/Cyberbotics.asc -P /etc/apt/keyrings
RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/Cyberbotics.asc] https://cyberbotics.com/debian binary-amd64/" | tee /etc/apt/sources.list.d/Cyberbotics.list

#onshape tools
# ENV PATH="$PATH:$HOME/.local/bin"
# ENV PIPX_BIN_DIR="/usr/local/bin"
RUN apt-get update
RUN apt-get install -y pipx
#need to figure this out later
# RUN pipx install onshape-to-robot
RUN apt-get install -y openscad meshlab


RUN chsh -s /bin/zsh
CMD ["zsh"]
