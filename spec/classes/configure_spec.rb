require 'spec_helper'

describe 'ldapclient', :type => :class do
  let(:title) { 'ldapclient::configure' }

  context 'with default params' do
    it { should contain_augeas('nslcd.conf')
        .with_incl('/etc/nslcd.conf')
        .with_lens('Spacevars.simple_lns')
        .with_changes(/set uri ldapi:\/\/\//)
        .with_changes(/set base dc=company,dc=com/)
    }

    it { should contain_augeas('nsswitch')
        .with_context('/files/etc/nsswitch.conf')
        .with_changes(/set database\[. = "passwd"\]\/service\[1\] compat/)
        .with_changes(/set database\[. = "passwd"\]\/service\[2\] ldap/)
        .with_changes(/set database\[. = "group"\]\/service\[1\] compat/)
        .with_changes(/set database\[. = "group"\]\/service\[2\] ldap/)
        .with_changes(/set database\[. = "shadow"\]\/service\[1\] compat/)
        .with_changes(/set database\[. = "shadow"\]\/service\[2\] ldap/)
    }
  end

  context 'ldap_uri => ldap://192.168.1.1' do
    let(:params) { {:ldap_uri => 'ldap://192.168.1.1'} }

    it { should contain_augeas('nslcd.conf')
        .with_changes(/set uri ldap:\/\/192.168.1.1/)
    }
  end

  context 'base_dn => dc=lan' do
    let(:params) { {:base_dn => 'dc=lan'} }

    it { should contain_augeas('nslcd.conf')
        .with_changes(/set base dc=lan/)
    }
  end
end
