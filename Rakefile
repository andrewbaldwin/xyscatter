# Rakefile
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('xyscatter', '0.1.0') do |p|
  p.description    = "this provides a generic xy scatter plot"
  p.url            = "http://github.com/andrewbaldwin/xyscatter"
  p.author         = "Andrew Baldwin"
  p.email          = "andrew.baldwin@bcs.org.uk"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

