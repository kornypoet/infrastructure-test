shared_examples 'cloud formation machine', cloud_formation: true do
  context command('ruby --version') do
    its(:stdout){ should match /2.0/ }
  end

  context command('puppet --version') do
    its(:stdout){ should match /3.8.4/ }
  end

  context service('amazon-ssm-agent') do
    it{ should be_running }
  end

  context service('codedeploy-agent') do
    it{ should be_running }
  end
end
