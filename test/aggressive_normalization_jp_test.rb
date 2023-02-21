# frozen_string_literal: false

require_relative "./test_helper"

class AggressiveNormalizationJpTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::AggressiveNormalizationJp.const_defined?(:VERSION)
    end
  end

  test "normalization" do
    str = "⓿❶❷❸❹❺❻❼❽❾"
    assert_equal("0123456789", str.normalization)

    str = "【】（）〔〕［］"
    assert_equal("[]()[][]", str.normalization)

    str = "！？～〜＼／・|｜"
    assert_equal("!?~~", str.normalization)

    str = "a   b"
    assert_equal("a b", str.normalization)
  end

  test "normalization!" do
    str = "⓿❶❷❸❹❺❻❼❽❾".normalization!
    assert_equal("0123456789", str)

    str = "【】（）〔〕［］".normalization!
    assert_equal("[]()[][]", str)

    str = "！？～〜＼／・|｜".normalization!
    assert_equal("!?~~", str)

    str = "a   b".normalization!
    assert_equal("a b", str)
  end

  test "feature" do
    str = "a b'c.d-e_f"
    assert_equal("abcdef", str.feature)
  end

  test "feature!" do
    str = "a b'c.d-e_f".feature!
    assert_equal("abcdef", str)
  end
end
