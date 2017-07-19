require 'test_helper'

class CaseInsensitiveHashTest < Minitest::Test
  describe '[] and []=' do
    let(:sut) { CaseInsensitiveHash.new }

    def altered_key_matches(original_key, altered_key, msg)
      expected = sut[original_key]
      actual = sut[altered_key]
      assert_equal expected, actual, msg
    end

    def can_retrieve_by_altered_key(original_key:, altered_key:, value:)
      can_retrieve_by_altered_key_impl(
        original_key: original_key,
        altered_key: altered_key,
        value: value
      )
      can_retrieve_by_altered_key_impl(
        original_key: altered_key,
        altered_key: original_key,
        value: value
      )
    end

    def can_retrieve_by_altered_key_impl(original_key:, altered_key:, value:)
      sut[original_key] = value
      msg = "Key set by #{original_key} cannot be retrieved by #{altered_key}"
      altered_key_matches(original_key, altered_key, msg)
    end

    it 'fetches via upcased keys' do
      can_retrieve_by_altered_key(
        original_key: 'foo',
        altered_key: 'FOO',
        value: 'some value'
      )
    end

    it 'fetches via symbol' do 
      can_retrieve_by_altered_key(
        original_key: 'foo',
        altered_key: :foo,
        value: 'some value'
      )
    end

    it 'fetches via downcased key' do
      can_retrieve_by_altered_key(
        original_key: 'FOO',
        altered_key: 'foo',
        value: 'some value'
      )
    end

    it 'fetches via miscased symbol' do
      can_retrieve_by_altered_key(
        original_key: 'FOO',
        altered_key: :foo,
        value: 'some value'
      )
    end
  end
end
