require 'time'
require 'date'
class Todo < ActiveRecord::Base
  belongs_to :user
  def time_left
    x = Date.parse(self.created_at.to_s)
    y = x + 7
    time_left = (y - Date.today).to_i
  end 
end
