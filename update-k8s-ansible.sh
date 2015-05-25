#/bin/sh
# Updates the bundled Kubernetes Ansible scripts for the next image build
git fetch https://github.com/eparis/kubernetes-ansible
git subtree pull --prefix content/kubernetes-ansible \
                 https://github.com/eparis/kubernetes-ansible master --squash
