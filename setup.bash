pushd `pwd`
if rvm --version 2>/dev/null; then
  gem install soloist --no-rdoc --no-ri
else
  sudo gem install soloist --no-rdoc --no-ri
fi

# create the cookbooks dir and write the soloistrc in it
mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- cc_workstation::ruby_workstation
EOF

# Grab the pivitol_workstation cookbook (using curl because a fresh machine doesn't have git)
mkdir -p ~/cookbooks/pivotal_workstation
cd  ~/cookbooks/pivotal_workstation
curl -L http://github.com/pivotal/pivotal_workstation/tarball/master | gunzip | tar xvf - --strip=1

# run soloist to install everything
cd ~/cookbooks
soloist
popd
