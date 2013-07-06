# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

va=User.create([{ name: 'vasya', email: "v@v.v", password_digest: 'vvv' }])
mi=User.create([{ name: 'misha', email: "m@m.m", password_digest: 'mmm' }])
pe=User.create([{ name: 'petya', email: "p@p.p", password_digest: 'ppp' }])
ko=User.create([{ name: 'kolya', email: "k@k.k", password_digest: 'kkk' }])

pr1=Project.create([{ name: 'pr1', hostid: 1}])
pr2=Project.create([{ name: 'pr2', hostid: 1}])
pr3=Project.create([{ name: 'pr3', hostid: 1}])
 
# pr1.users=[mi, pe]
# pr2.users=[mi, ko]
# pr3.users=[ko, pe]

Project.find(1).users=[User.find(2), User.find(3)]
Project.find(2).users=[User.find(2), User.find(4)]
Project.find(3).users=[User.find(4), User.find(3)]



# t11=Task.create([{ name: 't11', content: 'ttt11', masterid: 1, project_id: 1}])
# t12=Task.create([{ name: 't12', content: 'ttt12', masterid: 1, project_id: 1}])
# t21=Task.create([{ name: 't21', content: 'ttt21', masterid: 1, project_id: 2}])
# t22=Task.create([{ name: 't22', content: 'ttt22', masterid: 1, project_id: 2}])

t11=Task.create([{ name: 't11', content: 'ttt11', masterid: 1}])
t12=Task.create([{ name: 't12', content: 'ttt12', masterid: 1}])
t21=Task.create([{ name: 't21', content: 'ttt21', masterid: 1}])
t22=Task.create([{ name: 't22', content: 'ttt22', masterid: 1}])

Project.find(1).tasks=[Task.find(1), Task.find(2)]
Project.find(2).tasks=[Task.find(3), Task.find(4)]