shared_examples 'cloud formation machine', cloud_formation: true do
  context command('ruby --version') do
    its(:stdout){ is_expected.to match /2.0/ }
  end

  context command('puppet --version') do
    its(:stdout){ is_expected.to match /3.8.4/ }
  end

  context service('amazon-ssm-agent') do
    it { is_expected.to be_running }
  end

  context service('codedeploy-agent') do
    it { is_expected.to be_running }
  end

  context file('/tmp') do
    it { is_expected.to be_mounted }
  end

  context file('/var') do
    it { is_expected.to be_mounted }
  end

  context file('/var/log/audit') do
    it { is_expected.to be_mounted }
  end

  context file('/home') do
    it { is_expected.to be_mounted }
  end
end
