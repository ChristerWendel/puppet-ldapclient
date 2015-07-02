# == Class: ldapclient::install
#
# Installs libpam-ldapd
class ldapclient::install {
  package { 'libpam-ldapd':
    ensure => $ldapclient::version,
  }
}
