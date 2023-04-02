extends Node2D

var sceneSwitcher = preload("res://SceneChanger.tscn")

func _ready():
	var chara = get_node("player")
	GLOBAL.SCENE = 4;
	chara.position.x = 1920/2;
	chara.position.y = 250;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(_body):
	GLOBAL.s = get_node("RichTextLabel").s
	GLOBAL.m = get_node("RichTextLabel").m
	var items = get_tree().get_nodes_in_group("item")
	add_child(sceneSwitcher.instance())
	for item in items:
		item.get_parent().remove_child(item)
	get_node("SceneChanger").change_scene("res://SecondScene.tscn", 0.1)
