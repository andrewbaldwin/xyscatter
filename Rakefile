# Rakefile
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('xyscatter', '0.1.2') do |p|
  p.description    = "this provides a generic xy scatter plot (v0.1.1 added bubble functionality)"
  p.url            = "http://github.com/andrewbaldwin/xyscatter"
  p.author         = "Andrew Baldwin"
  p.email          = "andrew.baldwin@bcs.org.uk"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

