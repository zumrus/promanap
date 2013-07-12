# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

12.times do |t|
  User.create([{ name: "Vasya#{t}", password: "password", email: "#{t}@1.ru" }])
end

3.times do |t|
  Project.create([{ name: "Proj#{t}", hostid: User.find_by_email("#{t}@1.ru").id }])
end

11.times do |t|
  Project.find_by_name("Proj0").users.push(User.find_by_email("#{t+1}@1.ru"))
end

6.times do |t|
  Project.find_by_name("Proj1").users.push(User.find_by_email("#{t+3}@1.ru"))
end

6.times do |t|
  Project.find_by_name("Proj2").users.push(User.find_by_email("#{t+6}@1.ru"))
end

3.times do |t|
  Project.find_by_name("Proj0").tasks.create([{ name: "task_0_#{t}", content: "do "*(30*t), masterid: User.find_by_email("0@1.ru").id}])
  Task.find_by_name("task_0_#{t}").users=Project.find_by_name("Proj0").users
end

3.times do |t|
  Project.find_by_name("Proj1").tasks.create([{ name: "task_1_#{t}", content: "do "*(30*t), masterid: User.find_by_email("1@1.ru").id}])
  Task.find_by_name("task_1_#{t}").users=[Project.find_by_name("Proj1").users[t], Project.find_by_name("Proj1").users[t+3]]
end

12.times do |t|
  Project.find_by_name("Proj2").tasks.create([{ name: "task_2_#{t}", content: "do "*(30*t), masterid: User.find_by_email("2@1.ru").id}])
  Task.find_by_name("task_2_#{t}").users=[Project.find_by_name("Proj2").users[t/2]]
end




# t11=Task.create([{ name: "t11", content: "ttt11", masterid: 1, project_id: 1}])
# t12=Task.create([{ name: "t12", content: "ttt12", masterid: 1, project_id: 1}])
# t21=Task.create([{ name: "t21", content: "ttt21", masterid: 1, project_id: 2}])
# t22=Task.create([{ name: "t22", content: "ttt22", masterid: 1, project_id: 2}])

# t11=Task.create([{ name: "t11", content: "ttt11", masterid: 1}])
# t12=Task.create([{ name: "t12", content: "ttt12", masterid: 1}])
# t21=Task.create([{ name: "t21", content: "ttt21", masterid: 1}])
# t22=Task.create([{ name: "t22", content: "ttt22", masterid: 1}])
# 
# Project.find(1).tasks=[Task.find(1), Task.find(2)]
# Project.find(2).tasks=[Task.find(3), Task.find(4)]