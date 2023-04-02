extends CanvasLayer

func _ready():
	if GLOBAL.SCORE > GLOBAL.BEST:
		GLOBAL.BEST = GLOBAL.SCORE
	get_node("ScoreLabel").text = "Best Score: " + str(GLOBAL.BEST) + " | Score: " + str(GLOBAL.SCORE)

func _on_ButtonStart_pressed():
	GLOBAL.s = 0;
	GLOBAL.SCORE = 0;
	SellingList.start_game()
	var _osef = get_tree().change_scene("res://FirstScene.tscn")
	pass # Replace with function body.
