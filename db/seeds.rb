# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mark = User.create(name: "Mark Miyashita", email: "mark@mark.com", password: "password", password_confirmation: "password")

todo = Project.create(name: "Todo")
shopping_list = Project.create(name: "Shopping List")
mark.projects << todo
mark.projects << shopping_list

do_everything = Task.create(name: "Do Everything", description: "this is how you do everything", requester: mark, assignee: mark)
todo.tasks << do_everything
