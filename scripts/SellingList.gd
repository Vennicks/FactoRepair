extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var needed = []
var neededSprites = []
const primary_elem = ["copperIngot", "ironIngot", "goldIngot"]
const primary_sprite = [preload("res://Sprites/cable_elec.png"), preload("res://Sprites/plaque_acier.png"), preload("res://Sprites/circuit_imprime.png")]
var indent_list = 40

# Called when the node enters the scene tree for the first time.
func start_game():
	needed = []
	neededSprites = []
	indent_list = 40
	new_request();
	new_request();
	new_request();
	new_request();
	new_request();
	new_request();
	pass # Replace with function body.

func add_item(index):
	var itemType = primary_elem[index]
	print(itemType)
	needed.append(itemType)
	var newSelling = Sprite.new()
	newSelling.set_texture(primary_sprite[index])
	newSelling.set_scale(Vector2(0.15, 0.15))
	add_child(newSelling)
	newSelling.set_global_position(Vector2(50, indent_list))
	neededSprites.append(newSelling)
	indent_list = indent_list + 100
	newSelling.z_index = 25

func remove_item(item):
	var founded = false
	for i in range(needed.size()):
		if item.itemType == needed[i]:
			print(i)
			SellingList.needed.remove(i)
			SellingList.neededSprites[i].free()
			SellingList.neededSprites.remove(i)
			print("Thanks for the " + item.itemType)
			founded = true
			repositionList(i)
			break
	if !founded:
		print("I don't need that !")
	

func repositionList(index):
	for i in range(neededSprites.size() - index):
		print("Repositioning")
		var x = i + index
		neededSprites[x].set_global_position(Vector2(50, neededSprites[x].global_position.y - 100))
		indent_list = indent_list - 100

func new_request():
	randomize()
	var rand_nbr = randi() % 3
	print(rand_nbr)
	add_item(rand_nbr)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
