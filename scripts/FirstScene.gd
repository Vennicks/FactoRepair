extends Node2D

var sceneSwitcher = preload("res://SceneChanger.tscn")

func _ready():
	var chara = get_node("player")
	if GLOBAL.SCENE == 2:
		chara.position.x = 1920/2;
		chara.position.y = 1080-250;
	else:
		chara.position.x = 434;
		chara.position.y = 414;
	GLOBAL.SCENE = 1;


func _on_Exit_body_entered(_body):
	GLOBAL.s = get_node("RichTextLabel").s
	GLOBAL.m = get_node("RichTextLabel").m
	var items = get_tree().get_nodes_in_group("item")
	for item in items:
		item.get_parent().remove_child(item)
	add_child(sceneSwitcher.instance())
	get_node("SceneChanger").change_scene("res://SecondScene.tscn", 0.1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
