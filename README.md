# ansible-vagrant-kubernetes

The default k8s Vagrant instructions rely on using `curl` to retrieve a script
and piping it to `sh` to do the setup.

Inspired by [atomicapp](https://github.com/projectatomic/atomicapp), this
repo instead relies on creating a `bootstrap-kubernetes` Docker container
that can be run with administrative privileges to create a local Vagrant
based Kubernetes environment.

Once it's finished, the following command sequence should bootstrap a local
k8s cluster with a master & 2 minions:

    # dnf install atomic
    # systemctl start docker.service
    # atomic run ncoghlan/bootstrap-kubernetes

(Technically, this could be done with just plain docker and the appropriate
incantation to give the running container full access to the host system, but
it's neater to use the atomic wrapper layer that gets the command line
parameters from the container's `RUN` label)

System Requirements
-------------------

TBD (RAM and storage allocation for the VMs)


Rationale
---------

The main end user benefit over curl+sh is substantially improved traceability
and auditability. Shell scripts downloaded off the web don't come with any
provenance metadata, while Docker images do. Also, if your Docker configuration
is deliberately limited to only use a private image registry, that will
affect this bootstrapping image as well.

From a tooling perspective, using a full Docker container allows this
bootstrapping image to rely on
[Oh My Vagrant!](https://github.com/purpleidea/oh-my-vagrant) and [Kubernetes
Ansible scripts](https://github.com/eparis/kubernetes-ansible) without
end users of the bootstrapping operation needing to care about those
implementation details.

