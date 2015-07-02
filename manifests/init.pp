# == Class: ldapclient
#
# A module to configure a ldap client
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["ldap_uri"]
#   URI of LDAP server
#
# ["base_dn"]
#   Base dn for ldap search
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet

class ldapclient (
  $version = 'present',
  $ldap_uri = 'ldapi:///',
  $base_dn = 'dc=company,dc=com',
  $enable = true,
  $start = true
  )  {
    class{'ldapclient::install': } ->
    class{'ldapclient::configure': } ~>
    class{'ldapclient::service': } ->
    Class['ldapclient']
  }
