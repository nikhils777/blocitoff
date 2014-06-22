require 'time'
require 'date'
class Todo < ActiveRecord::Base
  belongs_to :user
  def time_left
    created = Date.parse(self.created_at.to_s)
    finish = created + 7
    time_left = (finish - Date.today).to_i
  end 
end
