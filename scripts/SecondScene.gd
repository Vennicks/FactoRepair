extends Node2D

var sceneSwitcher = preload("res://SceneChanger.tscn")

func _ready():
	print(GLOBAL.itemType)
	var chara = get_node("player")
	if GLOBAL.SCENE == 1:
		chara.position.x = 1920/2;
		chara.position.y = 250;
	elif GLOBAL.SCENE == 3:
		chara.position.x = 1920-250;
		chara.position.y = 1080/2;
	elif GLOBAL.SCENE == 4:
		chara.position.x = 1920/2;
		chara.position.y = 1080-250;
	elif GLOBAL.SCENE == 5:
		chara.position.x = 250;
		chara.position.y = 1080/2;
	GLOBAL.SCENE = 2;


func _on_ReturnDesk_body_entered(_body):
	GLOBAL.s = get_node("RichTextLabel").s
	GLOBAL.m = get_node("RichTextLabel").m
	var items = get_tree().get_nodes_in_group("item")
	for item in items:
		item.get_parent().remove_child(item)
	add_child(sceneSwitcher.instance())
	get_node("SceneChanger").change_scene("res://FirstScene.tscn", 0.1)


func _on_goToFirstRes_body_entered(_body):
	GLOBAL.s = get_node("RichTextLabel").s
	GLOBAL.m = get_node("RichTextLabel").m
	var items = get_tree().get_nodes_in_group("item")
	for item in items:
		item.get_parent().remove_child(item)
	add_child(sceneSwitcher.instance())
	get_node("SceneChanger").change_scene("res://ThirdScene.tscn", 0.1)


func _on_goToSecondtRes_body_entered(_body):
	GLOBAL.s = get_node("RichTextLabel").s
	GLOBAL.m = get_node("RichTextLabel").m
	var items = get_tree().get_nodes_in_group("item")
	for item in items:
		item.get_parent().remove_child(item)
	add_child(sceneSwitcher.instance())
	get_node("SceneChanger").change_scene("res://FourthScene.tscn", 0.1)


func _on_goToThirdtRes_body_entered(_body):
	GLOBAL.s = get_node("RichTextLabel").s
	GLOBAL.m = get_node("RichTextLabel").m
	var items = get_tree().get_nodes_in_group("item")
	for item in items:
		item.get_parent().remove_child(item)
	add_child(sceneSwitcher.instance())
	get_node("SceneChanger").change_scene("res://FifthScene.tscn", 0.1)
