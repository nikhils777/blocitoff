desc "Delete Todos older than 7 days"
task delete_todo: :environment do
  puts "Deleting Todos!" 
  @todos = Todo.all
  @todos.each do |x|
    if x.time_left <= 0
      puts "deleting #{x.description}"
      x.destroy
    end
  end
end