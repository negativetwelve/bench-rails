class Task < ActiveRecord::Base
  belongs_to :assignee, class_name: "User"
  belongs_to :requester, class_name: "User"
  belongs_to :project
end
