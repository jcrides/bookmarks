require 'test_helper'

class FolderTest < ActiveSupport::TestCase

  test "create folder" do
    folder = Folder.create(name: "Basic", description: "All fields")
    assert folder.valid?, "Folder create failed with all fields!"
  end

  test "create folder no name" do
    folder = Folder.create(description: "Something missing")
    assert_not folder.valid?, "Should fail create without a folder name!"
  end

  test "create folder wrong length name" do
    folder = Folder.create(name: "nop")
    assert_not folder.valid?, "Should fail create with short folder name!"
  end
  
  # test "the truth" do
  #   assert true
  # end
end
