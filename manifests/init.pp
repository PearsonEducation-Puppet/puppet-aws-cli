# == Class: puppet-aws-cli
#
# This class ensures that python2.7 and python-pip are installed as awscli dependencies.
# awscli is installed by this class once dependencies are installed.
#
# === Authors
#
# Author Name tehmasp@gmail.com
#
# === Copyright
#
# Copyright (C) 2013 Tehmasp Chaudhri <tehmasp@gmail.com>
#
class puppet-aws-cli {

  $pkgs = ['python2.7', 'python-pip']
  package { $pkgs: ensure => 'installed' }

  exec { 'pip install awscli':
    command => 'pip install awscli',
    path    => [ '/usr/sbin', '/usr/bin', '/sbin', '/bin' ],
    unless  => 'which aws',
    require => Package[$pkgs],
    user    => 'root',
    timeout => '0',
  }

}
