TODO :

- parametrize vagrant box and mount Vagrantfile
- parametrize port to forward
- X11 display


About
=====

Running vagrant inside a docker container. We use a small box based on OpenWRT 15.05 as a lightweight distro (7MB).

Requirements
============

You need vagrant kernel modules on the host.

But why?
========

To quote the FOSDEM2017 presentation on "Running virtual machines in containers":

https://fosdem.org/2017/schedule/event/virtcontainers/

```
The idea of running virtual machines inside containers is surprisingly old and
was used due to several reasons. They include willingness to run VM-s in
container orchestration engines like Kubernetes or Borg, or packaging IaaS
cloud software like OpenStack in containers. In this presentation, I am going
to describe these use cases and two main different approaches of containerizing
VM-s - putting every qemu(-kvm) process in a separate container (like Borg or
Rancher OS are doing) and putting libvirtd process in container (like OpenStack
Kolla or Stackanetes are doing)
```

Usage
=====

Just launch ```./run.sh```

Oneliner
========

You can also run it as a oneliner:

```
docker run --privileged -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxnetctl:/dev/vboxnetctl -it zoobab/vagrant-inside-docker:latest /bin/bash -c "vagrant up && vagrant ssh"
```

Bugs
====

* Sometimes ```docker stop``` takes time to stop the running container, or never stops it :-)
* Sometimes virtualbox of the GUEST container is very sensitive to the version
of the HOST, so the closer they are the better.
* I had to upgrade and do some debian pinning to have virtualbox and vagrant
from Ubuntu Zesty while the rest of the distro was still on Xenial. Will
provide a pinning example once I have it working.



Links
=====

* FOSDEM2017: Running virtual machines in containers https://fosdem.org/2017/schedule/event/virtcontainers/
