require "bundler/gem_tasks"
task :default => :spec

require "rake/extensiontask"
Rake::ExtensionTask.new("native") do |ext|
  ext.lib_dir = "lib/seq2gif"
end
