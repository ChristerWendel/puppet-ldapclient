require 'spec_helper'

describe 'ldapclient', :type => :class do
  let(:title) { 'ldapclient::service' }

  context 'with default parameters' do
    it { should contain_service('nslcd')
        .with_ensure('running')
        .with_enable('true')
    }

    it { should contain_service('nscd')
        .with_ensure('running')
        .with_enable('true')
    }
  end

  context 'enable => false' do
    let(:params) { {:enable => 'false'} }

    it { should contain_service('nslcd')
        .with_ensure('running')
        .with_enable('false')
    }

    it { should contain_service('nscd')
        .with_ensure('running')
        .with_enable('false')
    }
end

  context 'start => false' do
    let(:params) { {:start => 'false'} }

    it { should contain_service('nslcd')
        .with_ensure('stopped')
        .with_enable('true')
    }

    it { should contain_service('nscd')
        .with_ensure('stopped')
        .with_enable('true')
    }
end
end
