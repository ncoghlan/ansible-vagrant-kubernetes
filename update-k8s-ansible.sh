#/bin/sh
# Updates the bundled Kubernetes Ansible scripts for the next image build
git fetch https://github.com/eparis/kubernetes-ansible
git subtree pull --prefix content/omv/ansible/modules/kubernetes \
                 https://github.com/eparis/kubernetes-ansible master --squash
