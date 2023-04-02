extends Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var type = "Node"

var client = KinematicBody2D.new()
var clientSprite = Sprite.new()

var clientTexture = preload("res://Sprites/icon.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
