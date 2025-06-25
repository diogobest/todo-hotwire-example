class Task < ApplicationRecord
  broadcasts_to -> (task) { :tasks }
end
