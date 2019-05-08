require_relative "../../../support/ruby/helper.rb"

# Subject under test
def fetch(id)
  item = find(id)
  item.last_accessed_at = Time.new
  return item
end

# Test
class MissingAssertions < SmellTest
  def test_find_42
    result = find(42)

    assert_equal "Fred", result.name
  end

  def test_find_nil_on_other_number
    result = find(41)

    assert_nil result
  end

  def test_fetch
    result = fetch(42)

    assert_equal "Fred", result.name
    assert_equal Time, result.last_accessed_at.class
  end

end

# Fake production implementations to simplify example test of subject
def find(id)
  if id == 42
    OpenStruct.new(name: "Fred")
  end
end
