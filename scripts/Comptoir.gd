extends Area2D

const type = "comptoir"
var sceneSwitcher = preload("res://SceneChanger.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_item(item):
	SellingList.remove_item(item)
	if SellingList.needed == []:
		GLOBAL.SCORE = GLOBAL.s
		add_child(sceneSwitcher.instance())
		get_node("SceneChanger").change_scene("res://Menu.tscn", 0.1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
