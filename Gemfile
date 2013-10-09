source 'https://rubygems.org'

gemspec

gem 'refinerycms-i18n', github: 'refinery/refinerycms-i18n', branch: 'master'
gem 'quiet_assets'

gem 'protected_attributes'

# Database Configuration
unless ENV['TRAVIS']
  gem 'activerecord-jdbcsqlite3-adapter', '>= 1.3.0.rc1', platform: :jruby
  gem 'sqlite3', platform: :ruby
end

if !ENV['TRAVIS'] || ENV['DB'] == 'mysql'
  gem 'activerecord-jdbcmysql-adapter', '>= 1.3.0.rc1', :platform => :jruby
  gem 'mysql2', :platform => :ruby
end

if !ENV['TRAVIS'] || ENV['DB'] == 'postgresql'
  gem 'activerecord-jdbcpostgresql-adapter', '>= 1.3.0.rc1', :platform => :jruby
  gem 'pg', :platform => :ruby
end

group :test do
  gem 'refinerycms-testing', '~> 3.0.0.dev'
  gem 'generator_spec', '~> 0.9.0'
  gem 'launchy'
end

# Load local gems according to Refinery developer preference.
if File.exist? local_gemfile = File.expand_path('../.gemfile', __FILE__)
  eval File.read(local_gemfile)
end
