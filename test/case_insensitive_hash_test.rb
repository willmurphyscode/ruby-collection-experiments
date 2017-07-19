require 'test_helper'

class CaseInsensitiveHashTest < Minitest::Test
  describe '[] and []=' do
    let(:sut) { CaseInsensitiveHash.new }
    it 'fetches via upcased keys' do
      lower_key = 'foo'
      upper_key = 'FOO'
      value = 'test data'
      sut[lower_key] = value
      assert_equal sut[upper_key], value, 'failed to fetch by upcased key'
    end
  end
end
