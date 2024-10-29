# ROS-ENV

This is my docker-based environment with which to develop robots with ros2. 
To make it more versatile, I've made it fairly easy to change the ros2 version. 
Just change the top three lines to reflect the stats of a distro.

This is intended for use with distrobox with Podman and is developed for that purpose.
However, it could probably work with any docker-compatible runtime.

Have Fun.

## TODO
- Make cmd not useless.
- Add all the repos at the same time so that the apt-get update only needs to be called once. (This will speed up container build time I think)
