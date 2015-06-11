#/bin/sh
# Updates the bundled Kubernetes Ansible scripts for the next image build
git subtree pull --prefix kubernetes-ansible \
                 https://github.com/eparis/kubernetes-ansible master --squash
