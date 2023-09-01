FROM althack/ros:noetic-dev 

# ** [Optional] Uncomment this section to install additional packages. **
#
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
        && apt-get -y install --no-install-recommends \
        build-essential \
        git \
        python3-catkin-tools \
        python3-pip \
        python3-rosdep \
        python3-vcstool \
        python3-virtualenv \
        screen \
        jq \
        && apt-get autoremove -y \
        && apt-get clean -y \
        && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

#RUN ssh-keygen -R github.com -f /home/ros/.ssh/known_hosts
RUN mkdir /home/ros/.ssh && curl -L https://api.github.com/meta | jq -r '.ssh_keys | .[]' | sed -e 's/^/github.com /' >> /home/ros/.ssh/known_hosts
# Set up auto-source of workspace for ros user
ARG WORKSPACE
RUN echo "if [ -f ${WORKSPACE}/install/setup.bash ]; then source ${WORKSPACE}/install/setup.bash; fi" >> /home/ros/.bashrc

