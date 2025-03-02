# Vagrant

## Commands

-   `vagrant plugin install vagrant-vbguest --plugin-version 0.21`

    > Installs the vagrant-vbguest plugin with a specific version (not used on macOS to work).

-   `vagrant destroy -f`

    > Forces the destruction of the current Vagrant environment.

-   `vagrant up`

    > Starts and provisions the Vagrant environment.

-   `vagrant ssh`

    > Connects to the Vagrant environment via SSH.

-   `vagrant halt`

    > Halts the running Vagrant environment.

-   `vagrant box list`

    > Lists all available Vagrant boxes.

-   `vagrant box list | cut -d ' ' -f 1 | xargs -L1 vagrant box remove -f`
    > Removes all Vagrant boxes forcefully.

## Fix for Mac OS using Ubuntu

### Workaround

Install guest additions manually.

#### Example for Ubuntu box

First, remove `vagrant-vbguest` entries from `Vagrantfile`. Then:

```sh
vagrant destroy -f
vagrant plugin uninstall vagrant-vbguest
vagrant up # May stop with an error. It doesn't matter now.
vagrant ssh
sudo apt-get update
sudo apt-get install build-essential linux-headers-$(uname -r)
sudo apt-get install virtualbox-guest-dkms
exit
vagrant halt
vagrant up
```

It's okay now.

### My configuration

-   **Mac OS:** Catalina 10.15.7
-   **Vagrant:** 2.2.16
-   **VBGuest plugin:** 0.29.0
-   **VirtualBox:** 6.1.22
-   **Vagrant box:** bento/ubuntu-16.04 (virtualbox, 202104.19.0)
# devops
