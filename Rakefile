# rakefile
require 'rspec/core/rake_task'

Dir.glob('lib/tasks/*.rake').each { |r| load r}

RSpec::Core::RakeTask.new :spec do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

task :default => ['spec']
