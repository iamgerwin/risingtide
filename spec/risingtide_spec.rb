require 'spec_helper'

describe Risingtide::Client do

  before do
    @risingtide_client = Risingtide::Client.new('some_client_id', 'some_client_password', {shortcode: 'some_shortcode', usagetype: 'some_usagetype', mask: 'some_mask'})
  end

  it 'has a version number' do
    expect(Risingtide::VERSION).not_to be nil
  end

end
