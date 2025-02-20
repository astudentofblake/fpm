require File.join(File.dirname(__FILE__), "lib/fpm/version")
Gem::Specification.new do |spec|
  files = []
  dirs = %w{lib bin templates}
  dirs.each do |dir|
    files += Dir["#{dir}/**/*"]
  end

  files << "LICENSE"
  files << "CONTRIBUTORS"
  files << "CHANGELOG.rst"

  files = files.reject { |path| path =~ /\.pyc$/ }

  spec.name = "fpm"
  spec.version = FPM::VERSION
  spec.summary = "fpm - package building and mangling"
  spec.description = "Convert directories, rpms, python eggs, rubygems, and " \
    "more to rpms, debs, solaris packages and more. Win at package " \
    "management without wasting pointless hours debugging bad rpm specs!"
  spec.license = "MIT-like"

  spec.required_ruby_version = '>= 1.9.3'

  # For parsing JSON (required for some Python support, etc)
  # http://flori.github.com/json/doc/index.html
  spec.add_dependency("json", ">= 1.7.7", "< 3.0") # license: Ruby License

  # For logging
  # https://github.com/jordansissel/ruby-cabin
  spec.add_dependency("cabin", ">= 0.6.0") # license: Apache 2

  # For backports to older rubies
  # https://github.com/marcandre/backports
  spec.add_dependency("backports", ">= 2.6.2") # license: MIT

  # For reading and writing rpms
  spec.add_dependency("arr-pm", "~> 0.0.11") # license: Apache 2

  # For command-line flag support
  # https://github.com/mdub/clamp/blob/master/README.markdown
  spec.add_dependency("clamp", "~> 1.0.0") # license: MIT

  # For starting external processes across various ruby interpreters
  # Note: This is pinned because v1.0.0 fails to install for multiple users.
  # Ref: https://github.com/jordansissel/fpm/issues/1592
  spec.add_dependency("childprocess", "< 1.0.0") # license: ???

  # For calling functions in dynamic libraries
  # This is pinned because 1.13.0 requires Ruby 2.3 or later
  # Ref: https://github.com/jordansissel/fpm/issues/1708
  spec.add_dependency("ffi", "~> 1.12.0") # license: GPL3/LGPL3

  spec.add_development_dependency("rake", "~> 10") # license: MIT

  # For creating FreeBSD package archives (xz-compressed tars)
  spec.add_dependency("ruby-xz", "~> 0.2.3") # license: MIT

  # For sourcing from pleaserun
  spec.add_dependency("pleaserun", "~> 0.0.29") # license: Apache 2

  # For sourcing from git repos
  spec.add_dependency("git", ">= 1.3.0", "< 2.0") # license: MIT

  spec.add_dependency("stud")

  # In Ruby 3.0, rexml was moved to a bundled gem instead of a default one,
  # so I think this needs to be added explicitly?
  spec.add_dependency("rexml")

  spec.add_development_dependency("rspec", "~> 3.0.0") # license: MIT (according to wikipedia)
  spec.add_development_dependency("insist", "~> 1.0.0") # license: Apache 2
  spec.add_development_dependency("pry")

  spec.files = files
  spec.require_paths << "lib"
  spec.bindir = "bin"
  spec.executables << "fpm"

  spec.author = "Jordan Sissel"
  spec.email = "jls@semicomplete.com"
  spec.homepage = "https://github.com/jordansissel/fpm"
end

