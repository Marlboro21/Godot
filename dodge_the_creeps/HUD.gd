extends CanvasLayer

var scores

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$MessageLabel.text = "Dodge the\nCreeps"
	$MessageLabel.show()
	await get_tree().create_timer(1).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _ready():
	scores.load_scores()
	update_scoreboard()

func update_scoreboard():
	var scoreboard_text = "Top 5 Scores:\n"
	for i in range(scores.scores.size()):
		scoreboard_text += str(i + 1) + ": " + str(scores.scores[i]) + "\n"
	$ScoreBoard.text = scoreboard_text


func _on_StartButton_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func _on_score_board_ready():
	pass # Replace with function body.


func _on_ready():
	pass # Replace with function body.
