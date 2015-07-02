# == Class: ldapclient::service
#
# Controls the nslcd and nscd services
class ldapclient::service {
  $ensure = $ldapclient::start ? {true => running, default => stopped}

  service { 'nslcd':
    ensure => $ensure,
    enable => $ldapclient::enable,
  }

  service { 'nscd':
    ensure => $ensure,
    enable => $ldapclient::enable,
  }
}
