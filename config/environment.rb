# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
config.gem 'carrierwave', :version => '~> 0.4.10'
config.gem 'cloudinary'
end
