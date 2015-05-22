#/bin/sh
# Updates the bundled copy of Oh My Vagrant for the next image build
git fetch https://github.com/purpleidea/oh-my-vagrant
git subtree pull --prefix content/omv \
                 https://github.com/purpleidea/oh-my-vagrant master --squash
