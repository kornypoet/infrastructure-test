require 'spec_helper'

describe 'localhost', nodespec: { 'user' => 'trdempsey', 'adapter' => 'ssh' } do
  it_behaves_like 'cloud formation machine'

  context command('mongo --quiet --host 10.234.192.80 --eval "db.getMongo().getDBNames()"') do
    its(:stdout){ is_expected.to match /bank_verification/ }
  end

  context service('celery_analytics'), sudo: true do
    it { is_expected.to be_running.under('supervisor') }
  end

  context file('/data') do
    it { is_expected.to be_mounted }
  end

  context file('/app') do
    it { is_expected.to be_mounted }
  end

  context file('/var/log/venmo_platform') do
    it { is_expected.to be_mounted }
  end

  context file('/app/venmo-data-science/current') do
    it { is_expected.to be_directory }
  end

  context file('/app/venmo_platform/current') do
    it { is_expected.to be_directory }
  end
end
