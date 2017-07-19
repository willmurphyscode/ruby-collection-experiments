require 'test_helper'

class CollectionsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Collections::VERSION
  end
end
