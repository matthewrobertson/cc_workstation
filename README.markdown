# Installation Guide

## Purpose:

This document contains instructions for setting up a Ruby on Rails development environment on Mac OSX. The rational is to keep everyone's development environment consistent so that no devs experience surprise bugs / configuration errors.

## High Level Overview:

All utilities and configurations are set up using [soloist](https://github.com/mkocher/soloist) a stripped down, easy to user version of chef solo.

Most of recipes used are taken from the [pivitol workstation](https://github.com/pivotal/pivotal_workstation) project, but custom recipes can be added to this repository directly.

The following steps are covered in more depth below:

1. Install dependencies
2. Run the install script
3. Configure installed tools

## Before You Begin:

You will need to have your github username and password on hand as well as your apple ID and password. You can then proceed to install the necessary dependencies.

## Step 1: Install Dependencies

In order to complile a Ruby interpreter as well as Gem to "native extensions" (written in C or C++) you must have a compatible C / C++ compiler available on your system. The only option that has been tested to work with this guide is to install __XCODE__ and the __Command Line Tools for Xcode__.

### XCODE:

Download and install Xcode 4 from the App Store. Once it the install is complete, open up the application, accept the terms and conditions, and install any additional dependencies it prompts you to install.

### XCODE Command Line Utilities:

In order to access the XCode's compilers from the command line you must install the __Command Line Tools for Xcode__ which are available [here](https://daw.apple.com/cgi-bin/WebObjects/DSAuthWeb.woa/wa/login?appIdKey=d4f7d769c2abecc664d0dadfed6a67f943442b5e9c87524d4587a95773750cea&path=%2F%2Fdownloads%2Findex.action). In order to download the installer you need to sign in with your apple ID.

## Step 2: Run the Script

We have included a bash script that will pull down all necessary necessary cookbooks, install and run soloist. Cookbooks will be stored in `~/cookbooks`. To run the script run:

`$ curl -L https://raw.github.com/matthewrobertson/cc_workstation/master/setup.bash | bash`

_Note: if the script fails with complaints that xcode is not available, run the following command and try again:_

`$ sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer`

## Step 3: After Completion

Based on the standard configurations used, here are some additional notes for setting up and running the installed applications:

### MySQL

To start mysqld at boot time you have to copy `support-files/mysql.server` to the right place for your system

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER! To do so, start the server, then issue the following commands:

`$ /usr/local/Cellar/mysql/5.5.27/bin/mysqladmin -u root password 'new-password'`
`/usr/local/Cellar/mysql/5.5.27/bin/mysqladmin -u root -h Matthews-MacBook-Air.local password 'new-password'`

You can start the MySQL daemon with:

`cd /usr/local/Cellar/mysql/5.5.27 ; /usr/local/Cellar/mysql/5.5.27/bin/mysqld_safe &`

You can test the MySQL daemon with mysql-test-run.pl

`cd /usr/local/Cellar/mysql/5.5.27/mysql-test ; perl mysql-test-run.pl`

### Postgres

You can now start the database server using:

`$ postgres -D /usr/local/var/postgres`

or

`$ pg_ctl -D /usr/local/var/postgres -l logfile start`