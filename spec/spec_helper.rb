$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'risingtide'
require 'webmock/rspec'

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.ignore_localhost = true
end
