require "test_helper"

class TaskTest < ActiveSupport::TestCase

  test "should save task without name" do
    task = Task.new(completed: false)
    assert task.save, "Saved the task without a name"
  end

  test "should save task without name and completed" do
    task = Task.new(completed: true)
    assert task.save, "Saved the task without a name"
  end
  # test "the truth" do
  #   assert true
  # end
end
