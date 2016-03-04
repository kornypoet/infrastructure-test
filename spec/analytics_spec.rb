require 'spec_helper'

describe 'analytics', nodespec: { 'user' => 'trdempsey', 'adapter' => 'ssh' } do
  it_behaves_like 'cloud formation machine'

  context service('celery_analytics'), sudo: true do
    it { should be_running.under('supervisor') }
  end
end
