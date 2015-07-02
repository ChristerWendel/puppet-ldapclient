# == Class: ldapclient::configure
#
# Configures the nfs server
class ldapclient::configure {
  $ldap_uri = $ldapclient::ldap_uri
  $base_dn = $ldapclient::base_dn

  augeas { 'nslcd.conf':
    incl    => '/etc/nslcd.conf',
    lens    => 'Spacevars.simple_lns',
    changes => ["set uri ${ldap_uri}",
                "set base ${base_dn}",],
  }

  augeas { 'nsswitch':
    context => '/files/etc/nsswitch.conf',
    changes => template('ldapclient/nsswitch.erb'),
  }
}
