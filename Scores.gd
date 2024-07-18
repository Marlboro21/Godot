extends Node

var scores = []

func _ready():
	load_scores()

func load_scores():
	if File.new().file_exists("user://scores.save"):
		var file = File.new()
		file.open("user://scores.save", File.READ)
		scores = file.get_var()
		file.close()
	else:
		scores = [0, 0, 0, 0, 0]

func save_scores():
	var file = File.new()
	file.open("user://scores.save", File.WRITE)
	file.store_var(scores)
	file.close()

func add_score(new_score):
	scores.append(new_score)
	scores.sort()
	scores.reverse()
	if scores.size() > 5:
	

