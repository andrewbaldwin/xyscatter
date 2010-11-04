# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{xyscatter}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Baldwin"]
  s.date = %q{2010-11-04}
  s.description = %q{this provides a generic xy scatter plot (v0.1.1 added bubble functionality)}
  s.email = %q{andrew.baldwin@bcs.org.uk}
  s.extra_rdoc_files = ["README.rdoc", "lib/xyscatter.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/xyscatter.rb", "Manifest", "xyscatter.gemspec"]
  s.homepage = %q{http://github.com/andrewbaldwin/xyscatter}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Xyscatter", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{xyscatter}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{this provides a generic xy scatter plot (v0.1.1 added bubble functionality)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
