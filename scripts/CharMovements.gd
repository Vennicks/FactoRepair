extends KinematicBody2D
onready var anim = get_node("AnimatedSprite");

export (int) var speed = 350

const ironInstance = preload("res://ironItem.tscn")
const goldInstance = preload("res://goldItem.tscn")
const copperInstance = preload("res://copperItem.tscn")

var crafting = false
var selling = false
var taking = false

var item = null

const KEY_UP = 'up';
const KEY_DOWN = 'down';
const KEY_LEFT = 'left';
const KEY_RIGHT = 'right';
const KEY_SPRINT = 'sprint';
const KEY_INTERACT = 'interact';

var velocity = Vector2()
var toTake = 0;

func crafter():
	get_node("BruitForge").Bruit()
	item.transform()
	item.test()
	item.set_global_position(Vector2(1248,744));
	item = null
	GLOBAL.item = false
	GLOBAL.itemType = ""

func seller():
	get_tree().get_root().get_node("Node2D/Comptoir").get_item(item)
	item.free()
	item = null
	GLOBAL.item = false
	GLOBAL.itemType = ""

func taker():
	var generator = get_tree().get_root().get_node("Node2D/Generator")
	if !item && !generator.picked:
		var newItem = generator.get_node("item")
		newItem.test()
		newItem.get_parent().picked = true
		item = newItem
		GLOBAL.item = true
		GLOBAL.itemType = item.itemType
	pass
	

func get_input():
	velocity = Vector2()
	if !Input.is_action_pressed(KEY_RIGHT) and !Input.is_action_pressed(KEY_LEFT) and !Input.is_action_pressed(KEY_DOWN) and !Input.is_action_pressed(KEY_UP):
		anim.stop();
	if Input.is_action_pressed(KEY_RIGHT) and !Input.is_action_pressed(KEY_LEFT):
		anim.play("right");
		velocity.x += 1
	if Input.is_action_pressed(KEY_LEFT) and !Input.is_action_pressed(KEY_RIGHT):
		anim.play("left");
		velocity.x -= 1
	if Input.is_action_pressed(KEY_LEFT) and Input.is_action_pressed(KEY_RIGHT):
		anim.play("run");
		anim.stop();
	if Input.is_action_pressed(KEY_DOWN):
		anim.play("run");
		velocity.y += 1
	if Input.is_action_pressed(KEY_UP):
		anim.play("UP");
		velocity.y -= 1
	if Input.is_action_pressed(KEY_INTERACT):
		anim.set_frame(0);
		toTake = 1;
	if Input.is_action_pressed(KEY_SPRINT):
		speed = 370;
	else:
		speed = 200;
	if Input.is_action_just_pressed("interact") && taking:
		taker()
	elif Input.is_action_just_pressed("interact") && crafting && item:
		crafter()
	elif Input.is_action_just_pressed("interact") && selling && item:
		seller()
	velocity = velocity.normalized() * speed

func collide_manager(collider):
	if collider.type == "item":
		if Input.is_action_just_pressed("interact") and !crafting and !taking and !selling:
			if item:
				item.test()
				item = null
				GLOBAL.item = false
				GLOBAL.itemType = ""
			else:
				collider.test()
				item = collider
				GLOBAL.item = true
				GLOBAL.itemType = item.itemType

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		collide_manager(collision_info.collider)
	elif item:
		collide_manager(item)

func _ready():
	anim.play("run");
	anim.stop()
	if GLOBAL.item and !item:
		print("new Cedric Item")
		var x;
		if (GLOBAL.itemType == "iron" ):
			x = ironInstance.instance()
		if (GLOBAL.itemType == "gold"):
			x = goldInstance.instance()
		if (GLOBAL.itemType == "copper"):
			x = copperInstance.instance()
		if (GLOBAL.itemType == "ironIngot"):
			x = ironInstance.instance()
			x.transform()
		if (GLOBAL.itemType == "goldIngot"):
			x = goldInstance.instance()
			x.transform()
		if (GLOBAL.itemType == "copperIngot"):
			x = copperInstance.instance()
			x.transform()
		get_tree().get_root().add_child(x)
		x.test()
		item = x
		item.itemType = GLOBAL.itemType
		x.init()

func _on_Crafter_body_entered(_body):
	print("Enter Crafting Area")
	if (_body == self):
		crafting = true
	pass # Replace with function body.


func _on_Crafter_body_exited(_body):
	print("Exit Crafting Area")
	if (_body == self):
		crafting = false
	pass # Replace with function body.


func _on_Comptoir_body_entered(_body):
	if (_body == self):
		selling = true
	pass # Replace with function body.


func _on_Comptoir_body_exited(_body):
	if (_body == self):
		selling = false
	pass # Replace with function body.


func _on_Generator_body_entered(_body):
	print("entering")
	if (_body == self):
		print("player entering")
		taking = true
	pass # Replace with function body.


func _on_Generator_body_exited(_body):
	print("exiting")
	if (_body == self):
		print("player exiting")
		taking = false
	pass # Replace with function body.
