# docker_gnu_radio
A container that can run GNU radio. To be used in case of compatibility issues with your current distro.

To build enter directory of the docker file and run: 

`docker build -q -t gnu-radio:latest .`<br>

Make sure that you have X11 installed so that you can actually use the GUI!
To do this I used:
`yum install -y xorg-x11-server-Xorg xorg-x11-xauth`<br>

I then editted `/etc/ssh/sshd_config` and entered `X11Forwarding yes`

After this I ran `systemctl restart sshd`<br>

You can run this with the command:
`docker run -it --name gnuradio-container \`<br>
`    -e DISPLAY=$DISPLAY \`<br>
`    -v /tmp/.X11-unix:/tmp/.X11-unix gnu-radio:latest`<br>

If you want to mount a folder into this
`docker run -it --name gnuradio-container \`<br>
`    -e DISPLAY=$DISPLAY \`<br>
`    -v /tmp/.X11-unix:/tmp/.X11-unix \`<br>
`    -v path_to_your_folder:/mnt \ `<br>
`    gnu-radio:latest`<br>