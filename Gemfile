ruby '2.4.1'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# lockfile gem
gem 'lockfile'

# acts_as gems 
gem 'acts_as_commentable'

# font in ruby on rails
gem 'font-awesome-rails'

# bootstrap kaminari
gem 'bootstrap4-kaminari-views'
gem 'kaminari'

# contant view 
gem 'tinymce-rails'
gem 'bundler', '~> 1.16.4'
gem 'pry-rails', :group => :development
# Bootstrap form for 
gem "bootstrap_form", ">= 4.0.0.alpha1"
# Ruby on Rails in devise bootstrap
gem 'devise-bootstrap-views', '~> 1.0'
# Ruby on Rails_aws_S3 uploader
gem 'figaro'
gem 'fog-aws'
gem "mini_magick"
gem 'carrierwave'

# ruby on rails geust Managements
gem 'devise'
gem 'cancancan'
gem 'rolify'

# ruby on rails in bootstrap
gem 'bootstrap'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3' 
  gem 'pry'
end

group :development do
  gem 'rails_admin_rollincode', '~> 1.0'
  gem 'rails_admin', git: 'https://github.com/sferik/rails_admin.git'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_db'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
