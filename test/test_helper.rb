ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'
require 'simplecov'
SimpleCov.start

class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
  end
end
