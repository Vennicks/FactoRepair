extends Area2D

var sceneSwitcher = preload("res://SceneChanger.tscn")

func _on_Exit_body_entered(body):
	var items = get_tree().get_nodes_in_group("item")
	for item in items:
		item.get_parent().remove_child(item)
	add_child(sceneSwitcher.instance())
	get_node("SceneChanger").change_scene("res://SecondScene.tscn", 0.1)
