extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var picked = false;
const type = "item"
var itemType = "copper"

func test():
	if picked == false:
		print("pick up")
		picked = true
		z_index = 2
		get_node("CollisionShape2D").disabled = true
	else:
		print("put down")
		picked = false
		z_index = -1
		var player = get_tree().get_root().get_node("Node2D/player")
		if player:
			set_global_position(Vector2(player.position.x, player.position.y + 65))
		get_node("CollisionShape2D").disabled = false

# warning-ignore:unused_argument
func _physics_process(_delta):
	if picked == true:
		var player = get_tree().get_root().get_node("Node2D/player")
		if player:
			set_global_position(Vector2(player.position.x, player.position.y - 10))
# Called when the node enters the scene tree for the first time.

func transform():
	itemType = "copperIngot"
	GLOBAL.itemType = itemType
	var newSprite = get_node("Sprite")
	newSprite.set_texture(preload("res://Sprites/cable_elec.png"))
	newSprite.set_scale(Vector2(0.15, 0.15))

func init():
	if itemType == "copperIngot":
		var newSprite = get_node("Sprite")
		newSprite.set_texture(preload("res://Sprites/cable_elec.png"))
		newSprite.set_scale(Vector2(0.15, 0.15))
	if GLOBAL.SCENE != 1 and GLOBAL.SCENE != 2:
		var x = get_tree().get_root().get_node("Node2D/Generator")
		if x:
			global_position = x.global_position


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
