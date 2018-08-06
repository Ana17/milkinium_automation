require 'rspec'
require 'selenium-webdriver'
require 'require_all'
require 'page-object'
require 'page-object/page_factory'
require 'page-object/elements'
require 'pry'
require 'waitutil'
require 'faker'
require_all 'lib'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
 
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # --- added this stuff for browser ---
  config.before(:each) do |example|
    @browser = Selenium::WebDriver.for(:chrome)
  end

  config.after(:each) do |example|
    @browser.quit
  end
  # --- end ---

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
