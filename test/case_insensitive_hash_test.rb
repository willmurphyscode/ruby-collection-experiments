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

    it 'fetches via symbol' do 
      lower_key = 'foo'
      symbol_key = :foo
      value = 'test data'
      sut[lower_key] = value
      assert_equal sut[symbol_key], value, 'failed to fetch by symbol key'
    end
  end
end
