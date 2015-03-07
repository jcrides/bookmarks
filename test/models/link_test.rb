require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  test "create link" do
    link = Link.create(name: "Google", url: "https://www.google.com",
                       description: "Search with google")
    assert link.valid?, "Link should be valid with all fields!"
  end

  test "create link no name" do
    link = Link.create(url: "https://www.google.com", description: "Nope")
    assert_not link.valid?, "Should fail with no name!"
  end

  test "create link no url" do
    link = Link.create(name: "Google", description: "Nope")
    assert_not link.valid?, "Should fail with no url!"
  end

  # test "the truth" do
  #   assert true
  # end
end
