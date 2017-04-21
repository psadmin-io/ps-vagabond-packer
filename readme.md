# ps-vagabond Packer Templates

> This repository is a clone of mwrock/packer-templates.

These templates are used to generate the ps-vagabond-* vagrant base boxes found on Atlas. To build the VirtualBox templates:

```
packer build -force -only virtualbox-iso ps-vagabond.json
```


## Background

A Packer template that simplifies the creation of minimally-sized, fully patched Windows Vagrant boxes.

This repo and much of its content are covered in detail from [this blog post](http://www.hurryupandwait.io/blog/creating-windows-base-images-for-virtualbox-and-hyper-v-using-packer-boxstarter-and-vagrant). Also see [this post](http://www.hurryupandwait.io/blog/a-packer-template-for-windows-nano-server-weighing-300mb) specifically for the Nano Server template.

## Prerequisites

You need the following to run the template:

1. [Packer](https://packer.io/docs/installation.html) installed with a minimum version of 0.12.3.
2. [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - Tested with 5.1.12

## Invoking the template
Invoke `packer` to run a template like this:
```
packer build -force -only virtualbox-iso .\vbox-2016.json
```
## Hyper-V templates
The Hyper-V templates now use the official Hyper-V builder available in the latest versions of packer. I no longer convert Virtual Box images to Hyper-V.

## Converting to Hyper-V
As stated above, I no longer convert VirtualBox images to Hyper-V. However that can be useful if you are limited to mac or linux hardware for creating images. This repo includes PowerShell scripts that can create a Hyper-V Vagrant box from the output VirtualBox .vmdk file. This repo leverages [psake](https://github.com/psake/psake) and [Chocolatey](https://chocolatey.org) to ensure that all prerequisites are installed and then runs the above `packer` command followed by the scripts needed to produce a Vagrant .box file that can create a Hyper-V file.

See [this blog post](http://www.hurryupandwait.io/blog/creating-a-hyper-v-vagrant-box-from-a-virtualbox-vmdk-or-vdi-image) for more detail on converting VirtualBox disks to Hyper-V.

## Troubleshooting Boxstarter package run
[Boxstarter](http://boxstarter.org) is used by some templates for initial provisioning. Due to the fact that provisioning takes place in the builder and not a provisioner, it can be difficult to gain visibility into why things go wrong from the same console where `packer` is run.

Boxstarter will log all package activity output to `$env:LocalAppData\Boxstarter\boxstarter.log` on the guest.
