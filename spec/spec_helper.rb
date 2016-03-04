require 'nodespec'

Dir.glob(File.expand_path('../shared_examples/*.rb', __FILE__)).each{ |f| require f }
