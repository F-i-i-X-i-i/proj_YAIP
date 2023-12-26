require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
     assert true
  end

  test "should not save comment without title" do
    comment = Comment.new
    assert_not comment.save
  end
end
