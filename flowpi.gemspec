$:.push File.expand_path("../lib", __FILE__)

require 'flowpi/version'

Gem::Specification.new do |s|
  s.name        = 'flowpi'
  s.version     = Flowpi::VERSION
  s.date        = '2014-12-19'
  s.summary     = 'Flowdock bot to speak messages.'
  s.description = 'Small script to listen to flows on Flowdock and speak them with a synthesizer.'
  s.authors     = ['Olle Johansson']
  s.email       = 'Olle@Johansson.com'
  s.files       = Dir['{bin,lib}/**/*']
  s.homepage    =
    'https://github.com/ollej/flowpi'
  s.license     = 'MIT'
  s.executables << 'flowpi.rb'

  s.add_dependency 'json', '~> 1.8'
  s.add_dependency 'em-http-request', '~> 1.1'

  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'rake', '~> 10.4'
end
