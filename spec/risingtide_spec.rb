require 'spec_helper'

describe Risingtide::Sms do

  it 'has a version number' do
    expect(Risingtide::VERSION).not_to be nil
  end

  context 'SMS' do
    before do
      @risingtide = Risingtide::Sms.new("u/88/some_username", "some_password", "some_shortcode", "some_usagetype", "some_alias")
    end

    it 'has risingtide object' do
      expect(@risingtide).not_to be_nil
    end

    it 'send_sms' do
      VCR.use_cassette("send_sms", match_requests_on: [:method, :host]) do
        response = @risingtide.send_sms("639177148888", "This is a message")
        expect(response.message).to eq "ACCEPTED"
      end
    end
  end

  context 'Handle various errors' do
    before do
      @invalid_risingtide = Risingtide::Sms.new("u/88/invalid_username", "invalid_password", "invalid_shortcode", "invalid_usagetype", "invalid_alias")
    end

    it 'handles invalid credentials' do
      VCR.use_cassette('risingtide_invalid_credentials') do
        response = @invalid_risingtide.send_sms('9277782300', "Derp!")
        expect(response.message).to eq "FORBIDDEN"
      end
    end
  end
end
